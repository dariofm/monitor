import time, sys
import os 
from core.models import Uteis
from core.models import Configuracoes
import sqlite3
import firebirdsql
import configparser

config = configparser.RawConfigParser()
config.read('C:\\Kimmera Monitor\\monitor.ini')
caixa = config.getint('TERMINAL', 'Caixa')


conexao = firebirdsql.connect(user="SYSDBA",password="masterkey",database="C:\\Kimmera Monitor\\monitor.fdb",host="localhost",charset="ISO8859_1")


cursor = conexao.cursor()
uteis = Uteis()
configuracoes = Configuracoes()
database = uteis.conexao



def proximoNumero(GENERETOR):
  cursor.execute('SELECT GEN_ID('+GENERETOR+',1) AS ID_ATUAL FROM RDB$DATABASE');
  idAtual = 0
  for i in cursor.fetchall():
      idAtual = i[0]

  
  return idAtual


#Inicialização das var
ativo = True
produtos = []

def retornaProdutos(nota_num):
    movimento = database["Movimentacoes"]
    produtos = []

    iNumero = -1
    for i in movimento.find({"Numero":nota_num}):
        try:
            for item in i["ItensBase"]:
                iNumero = iNumero + 1
                produtos.insert(0,
                [i["ItensBase"][iNumero]["ProdutoServico"]["CodigoInterno"],
                i["ItensBase"][iNumero]["ProdutoServico"]["Descricao"],
                i["ItensBase"][iNumero]["ProdutoServico"]["UnidadeMedida"]["Sigla"],
                i["ItensBase"][iNumero]["Quantidade"],
                i["ItensBase"][iNumero]["PrecoUnitario"],
                i["ItensBase"][iNumero]["Cancelado"]
                ])
        except:
            produtos = ['Não há movimentação']
    return produtos

while ativo == True:
    movimento = database["Movimentacoes"]
    for i in movimento.find({"_t.3":"NotaFiscalManual"}):
        ultimo_numero = i["Numero"]
        emissao = "'"+"01.01.2020"+"'"
    cursor.execute('select controle from param')
    resultado = cursor.fetchall()
    controle = 0
    
    for i in resultado:
        
        controle = i[0]

    if controle == ultimo_numero:
        
        os.system('cls')
        print('Aguardando...')
    else:

        print('Imprimindo...')
        os.system('cls')
        #LOG
        f = open('C:\\Kimmera Monitor\\log.txt', 'w')
        f.write(str(retornaProdutos(ultimo_numero)))
       
        
        item = 0
        
        for i in retornaProdutos(ultimo_numero):
            item = item + 1
            idCodigo = proximoNumero('GEN_NOTA_MANUAL_ID')
            codigoInterno = i[0]
            descricao = "'"+i[1]+"'"
            unidade = "'"+i[2]+"'"
            quantidade = i[3]
            valor_unitario = i[4]
            total = i[3] * i[4]
            canc = i[5]
            impresso = 0
            try:
                cursor.execute("insert into NOTA_MANUAL(id,numero,item,emissao,codigointerno,descricao,und,qtd,valor_unitario, valor_total,caixa,impresso) values (%s,%s,%s,%s,%s,%s,%s,%d,%d,%d,%s,%s) "%(idCodigo,ultimo_numero,item,emissao,codigoInterno,descricao,unidade,quantidade,valor_unitario,total,caixa,impresso))
                conexao.commit()
            except:
                f.write(str(retornaProdutos(ultimo_numero)))
        f.close()
        #Atualiza último cupom gravado
        cursor.execute('update param set controle = %s'%(ultimo_numero))
        conexao.commit()
    time.sleep(0.01)


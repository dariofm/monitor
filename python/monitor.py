import time, sys
import os 
from core.models import Uteis
from core.models import Configuracoes
import sqlite3
import firebirdsql
import configparser
from funcoes import proximoNumero
from funcoes import trataData


config = configparser.RawConfigParser()
config.read('C:\\Kimmera Monitor\\Configuracao.ini')
usuario = config.get('Parametro', 'Usuario')
tipoDoc = config.get('Documento', 'TipoDoc')
conexao = firebirdsql.connect(user="SYSDBA",password="masterkey",database="C:\\Kimmera Monitor\\monitor.fdb",host="localhost",charset="ISO8859_1")


cursor = conexao.cursor()
uteis = Uteis()
configuracoes = Configuracoes()
database = uteis.conexao




mesa = database["ItensMesaConta"]
item = 0




#Inicialização das var
ultimo_numero = 0
ativo = True
produtos = []
#Retorna produtos vendidos no Nota Manual 
def retornaProdutos(nota_num):
    movimento = database["Movimentacoes"]
    produtos = []

    iNumero = -1
    for i in movimento.find({"Numero":nota_num,"_t.3":tipoDoc}):
        print(i)
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

query = {"_t.3":tipoDoc}
collection = {"Numero":1,"DataHoraEmissao":1,"NomeUsuario":1}
while ativo == True:

    movimento = database["Movimentacoes"]
    for i in movimento.find(query,collection).sort("Numero",-1).limit(1):
        
        try:
            ultimo_numero = i["Numero"]
            emissao = "'"+trataData(i["DataHoraEmissao"])+"'"
            usuario = "'"+i["NomeUsuario"]+"'"
        except:
            ultimo_numero = 0
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
        
        
       
        
        item = 0
        
        for i in retornaProdutos(ultimo_numero):
            
            item = item + 1
            idCodigo = proximoNumero('GEN_NOTA_MANUAL_ID')
            codigoInterno = i[0]
            descricao = "'"+i[1]+"'"
            unidade = "'"+i[2]+"'"
            quantidade = i[3]
            valor_unitario = i[4]
            print('--------------------------------------------------')
            print(i)
            print('--------------------------------------------------')
            total = i[3] * i[4]
            
            canc = i[5]
            impresso = 0
            f = open('C:\\Kimmera Monitor\\log.txt', 'w')
            try:
                
                f.write(str(valor_unitario)+' - '+str(retornaProdutos(ultimo_numero)))
                
                cursor.execute("insert into NOTA_MANUAL(id,numero,item,emissao,codigointerno,descricao,und,qtd,valor_unitario, valor_total,usuario,impresso) values (%s,%s,%s,%s,%s,%s,%s,%f,%f,%f,%s,%s) "%(idCodigo,ultimo_numero,item,emissao,codigoInterno,descricao,unidade,quantidade,valor_unitario,total,usuario,impresso))
                conexao.commit()
            except:
                f.write(str(valor_unitario)+' - '+str(retornaProdutos(ultimo_numero)))
            f.close()
        #Atualiza último cupom gravado
        cursor.execute('update param set controle = %s'%(ultimo_numero))
        conexao.commit()
    time.sleep(0.01)

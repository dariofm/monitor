import time, sys
import os 
from core.models import Uteis
from core.models import Configuracoes
import sqlite3
import firebirdsql
import configparser
from funcoes import proximoNumero
from funcoes import trataData
from bson import ObjectId


config = configparser.RawConfigParser()
config.read('C:\\Kimmera Monitor\\Configuracao.ini')
usuario = config.get('Parametro', 'Usuario')
tipoDoc = config.get('Documento', 'TipoDoc')
conexao = firebirdsql.connect(user="SYSDBA",password="masterkey",database="C:\\Kimmera Monitor\\monitor.fdb",host="localhost",charset="ISO8859_1")


cursor = conexao.cursor()
uteis = Uteis()
configuracoes = Configuracoes()
database = uteis.conexao
ativo = True       

os.system('cls')

while ativo == True:        
    query = {}
    setvalue = {}
    conta = 0
    mesa = database["ItensMesaConta"]
    #for i in mesa.find({"Situacao":2,"Impresso":True}):
    for i in mesa.find(
        {"Situacao":2,
        "Impresso":False,
        "ImpressoraReferencia":{"$ne": ObjectId("000000000000000000000000")}}):
        conta = i["NumeroMesaConta"]
        impresso = i["Impresso"]
        cancelado = i["Cancelado"]
        emissao  ="'"+trataData(i["DataHora"])+"'"
        codigoInterno = "'"+i["Codigo"]+"'" 
        descricao = "'"+i["Descricao"]+"'"    
        obsA =""
        obs = ""
        for x in i["Observacoes"]:
            obsA = obsA +x+', '

        obs = "'"+obsA+"'"
        unidade = "'"+i["Unidade"]+"'"
        quantidade = i["Quantidade"]
        valorUnit = i["ValorUnitario"]
        total = i["ValorUnitario"] * i["Quantidade"]
        delivery = i["Delivery"]
        idCodigo = proximoNumero('GEN_RESTAURANTE_ID')
        mov_ref = i["_id"]
        query = {"Situacao":2,"NumeroMesaConta":conta,"_id":mov_ref} 
        setvalue = {"$set":{"Impresso":True}}
        mesa.update_many(query,setvalue)

        cursor.execute("insert into RESTAURANTE(id,numero,emissao,codigointerno,descricao,und,qtd,valor_unitario,valor_total,impresso,obs) values (%s,%s,%s,%s,%s,%s,%f,%f,%f,%s,%s) "%(idCodigo,conta,emissao,codigoInterno,descricao,unidade,quantidade,valorUnit,total,0,obs))
        conexao.commit()
    os.system('cls')
    time.sleep(0.01)
          



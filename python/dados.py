import time, sys
import os 
from core.models import Uteis
from core.models import Configuracoes
import sqlite3
import firebirdsql
import configparser
from funcoes import proximoNumero



conexao = firebirdsql.connect(user="SYSDBA",password="masterkey",database="C:\\Kimmera Monitor\\monitor.fdb",host="localhost",charset="ISO8859_1")

cursor = conexao.cursor()
uteis = Uteis()
configuracoes = Configuracoes()
database = uteis.conexao


emitente = database["Pessoas"]
for i in emitente.find({"_t.2":"Emitente"}):
    nome = "'"+i["Nome"]+"'"
    nomeFantasia = "'"+i["NomeFantasia"]+"'"
    cnpj = "'"+i["Cnpj"]+"'"
    endereco = "'"+i["Carteira"]["EnderecoPrincipal"]["Logradouro"]+"'"
    numero = "'"+i["Carteira"]["EnderecoPrincipal"]["Numero"]+"'"
    bairro = "'"+i["Carteira"]["EnderecoPrincipal"]["Bairro"]+"'"
    cep = endereco = "'"+i["Carteira"]["EnderecoPrincipal"]["Cep"]+"'"
    cidade = endereco = "'"+i["Carteira"]["EnderecoPrincipal"]["Municipio"]["Nome"]+"'"
    
    cursor.execute("delete from emitente")
    cursor.execute("insert into emitente (nome,nomeFantasia,cnpj,endereco,numero,bairro,cep,cidade) values (%s,%s,%s,%s,%s,%s,%s,%s)"%(nome,nomeFantasia,cnpj,endereco,numero,bairro,cep,cidade))
    conexao.commit()

usuarios = database["Usuarios"]

cursor.execute("delete from usuario")
conexao.commit()  
for i in usuarios.find({"Ativo":True,"$nor": [ { "_t.2":"UsuarioRevenda"},{ "_t.2":"UsuarioSuporte"}]}):
#for i in usuarios.find({}):    

    nomeUsuario = "'"+i["AcessoAlternativo"]+"'"
    
    
  
    idUsuario = proximoNumero("GEN_USUARIO_ID")
    cursor.execute('insert into usuario (nome,id) values (%s,%s)'%(nomeUsuario,idUsuario))
    conexao.commit()
    
conexao.close

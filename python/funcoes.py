import firebirdsql


conexao = firebirdsql.connect(user="SYSDBA",password="masterkey",database="C:\\Kimmera Monitor\\monitor.fdb",host="localhost",charset="ISO8859_1")
cursor = conexao.cursor()

def proximoNumero(GENERETOR):
  cursor.execute('SELECT GEN_ID('+GENERETOR+',1) AS ID_ATUAL FROM RDB$DATABASE');
  idAtual = 0
  for i in cursor.fetchall():
      idAtual = i[0]
  return idAtual
  
  
def trataData(dataMongo):
    
    old = str(dataMongo)
    
    dia = old[8:10]
    mes = old[5:7]
    ano = old[0:4]

    return dia+'.'+mes+'.'+ano
    
  
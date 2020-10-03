import socket
from pymongo import MongoClient
from lxml import objectify


class Uteis:
    def __init__(self):
        f = open(r'C:\DigiSat\SuiteG6\Sistema\ConfiguracaoClient.xml', 'r')
        data = f.read()
        f.close()
        data = data.replace('<?xml version="1.0" encoding="utf-8"?>\n', '')
        data = data.replace('ï»¿', '')
        xml = objectify.fromstring(data)
        host = str(xml.Ip) if hasattr(xml, 'Ip') else '127.0.0.1'
        try:
            socket.inet_aton(host)
        except socket.error:
            try:
                host = socket.gethostbyname(host)
            except:
                host = '127.0.0.1'
        self.client = MongoClient(
            host=host, username='root', password='|cSFu@5rFv#h8*=',
            authSource='admin', port=12220, serverSelectionTimeoutMS=5000,
            connectTimeoutMS=10000, authMechanism='SCRAM-SHA-1'
        )

    @property
    def conexao(self):
        database = self.client['DigisatServer']
        return database

    def fecha_conexao(self):
        self.client.close()
        return True

    def execute(self, tabela, query, projection, sort, limit=100):
        database = self.conexao
        if limit == 0:
            busca = []
            if projection == {} and sort == {}:
                cursor = database[tabela].find(query)
            elif projection != {} and sort == {}:
                cursor = database[tabela].find(query, projection=projection)
            elif projection == {} and sort != {}:
                cursor = database[tabela].find(query, sort=sort)
            else:
                cursor = database[tabela].find(query, projection=projection, sort=sort)

            try:
                for doc in cursor:
                    doc['id'] = str(doc['_id'])
                    if '_t' in doc:
                        doc['t'] = str(doc['_t'])
                    busca.append(doc)
            finally:
                self.fecha_conexao()

            return busca
        elif limit == 1:
            if projection == {} and sort == {}:
                cursor = database[tabela].find_one(query)
            elif projection != {} and sort == {}:
                cursor = database[tabela].find_one(query, projection=projection)
            elif projection == {} and sort != {}:
                cursor = database[tabela].find_one(query, sort=sort)
            else:
                cursor = database[tabela].find_one(query, projection=projection, sort=sort)

            if cursor is not None:
                cursor['id'] = str(cursor['_id'])
            self.fecha_conexao()
            return cursor
        else:
            busca = []
            if projection == {} and sort == {}:
                cursor = database[tabela].find(query).limit(limit)
            elif projection != {} and sort == {}:
                cursor = database[tabela].find(query, projection=projection).limit(limit)
            elif projection == {} and sort != {}:
                cursor = database[tabela].find(query, sort=sort).limit(limit)
            else:
                cursor = database[tabela].find(query, projection=projection, sort=sort).limit(limit)

            try:
                for doc in cursor:
                    doc['id'] = str(doc['_id'])
                    if '_t' in doc:
                        doc['t'] = str(doc['_t'])
                    busca.append(doc)
            finally:
                self.fecha_conexao()

            return busca

    @staticmethod
    def split_number_on_potency(stg):
        # número dividido em partes de 3 dígitos invertidos
        new = []
        num = 3
        for start in range(len(stg), 0, -num):
            if start - num < 0:
                new.append(stg[0:start])
            else:
                new.append(stg[start - num:start])
        return new

    # esta função escreve o número em letras
    def num_to_str(self, num):
        # todas as palavras
        unidades = {
            '0': '',
            '1': 'um',
            '2': 'dois',
            '3': 'três',
            '4': 'quatro',
            '5': 'cinco',
            '6': 'seis',
            '7': 'sete',
            '8': 'oito',
            '9': 'nove'
        }
        dez = {
            '10': 'dez',
            '11': 'onze',
            '12': 'doze',
            '13': 'treze',
            '14': 'quatorze',
            '15': 'quinze',
            '16': 'dezesseis',
            '17': 'dezesete',
            '18': 'dezoito',
            '19': 'dezenove'
        }
        dezenas = {
            '2': 'vinte',
            '3': 'trinta',
            '4': 'quarenta',
            '5': 'cinquenta',
            '6': 'sessenta',
            '7': 'setenta',
            '8': 'oitenta',
            '9': 'noventa'
        }
        centenas = {
            '1': 'cento',
            '2': 'duzentos',
            '3': 'trezentos',
            '4': 'quatrocentos',
            '5': 'quinhentos',
            '6': 'seiscentos',
            '7': 'setecentos',
            '8': 'oitocentos',
            '9': 'novecentos'
        }
        pot_singular = [
            '',
            'mil',
            'milhão',
            'bilhão',
            'trilhão',
            'quatrilhão'
        ]
        pot_plural = [
            '',
            'mil',
            'milhões',
            'bilhões',
            'trilhões',
            'quatrilhões'
        ]
        str_num = str(num)
        int_num = int(num)
        stg = ''

        # zero precisa de regra especial
        if int_num == 0:
            stg = 'zero'
        else:
            # cada três números têm as mesmas regras
            nums = self.split_number_on_potency(str_num)
            stgs = []
            for idx, threeDigits in enumerate(nums):
                # cem precisa de regra especial para isso
                if threeDigits == '100':
                    three_stg: str = 'cem'
                else:
                    # primeiro, escrevemos dois primeiros dígitos
                    decimal = int(threeDigits[-2:])
                    if decimal == 0:
                        decimal_stg = ''
                    elif decimal <= 9:
                        decimal_stg = unidades[str(decimal)]
                    elif 10 <= decimal <= 19:
                        decimal_stg = dez[str(decimal)]
                    else:
                        first_digit = str(decimal)[:1]
                        second_digit = str(decimal)[-1:]
                        decimal_stg = dezenas[first_digit]
                        if int(second_digit) == 0:
                            pass
                        else:
                            decimal_stg += ' e '
                            decimal_stg += unidades[str(decimal)[-1:]]

                    # então, se houver três dígitos, podemos anexá-lo
                    if int(threeDigits) > 99:
                        three_stg = str(centenas[threeDigits[0]])
                        if not decimal == 0:
                            three_stg += ' e ' + decimal_stg
                    else:
                        three_stg = decimal_stg

                # agora vamos localizá-lo na potência adequada
                if int(threeDigits) > 1:
                    stgs.append(three_stg + ' ' + pot_plural[idx])
                elif int(threeDigits) == 1:
                    stgs.append(three_stg + ' ' + pot_singular[idx])
                elif int(threeDigits) == 0:
                    pass

            # Agora junte todos os números de três dígitos
            if stgs:
                first = True
                more_then_one_potency = True if len(stgs) > 1 else False
                for str_three_digit in stgs:
                    if first:
                        first = False
                        # tirar um espaço extra e
                        if str_three_digit[-1] == ' ':
                            str_three_digit = str_three_digit[:-1]

                        # alguns verbos necessários
                        if int(str_num[-3:]) <= 100 and more_then_one_potency:
                            stg += 'e '

                        stg += str_three_digit
                    else:
                        # regra para o resto dos casos
                        stg = str_three_digit + ' ' + stg
        return stg

    def num_to_currency(self, num):
        # partes de centésimos e inteiros divididos
        stg = ''
        num = '{0:.2f}'.format(num).replace('.', '').replace(',', '')
        cent = int(num[-2:])
        if len(num) > 2:
            inteiro = int(num[:-2])
        else:
            inteiro = 0

        # criar centavos
        tem_centavo = True
        if cent == 0:
            tem_centavo = False
        elif cent == 1:
            stg = '%s centavo' % (self.num_to_str(cent))
        else:
            stg = '%s centavos' % (self.num_to_str(cent))

        # criar string inteira e anexar centavos
        if inteiro == 0:
            pass
        else:
            if tem_centavo:
                stg = ' e ' + stg
            if inteiro == 1:
                stg = '%s real%s' % (self.num_to_str(inteiro), stg)
            else:
                if str(inteiro)[:-7:-1] == '000000':
                    stg = '%s de reais%s' % (self.num_to_str(inteiro), stg)
                else:
                    stg = '%s reais%s' % (self.num_to_str(inteiro), stg)
        return stg

    def total_venda(self, venda):
        # Setando variaveis de totalizadores globais das vendas
        venda['bruto'] = 0
        venda['desconto'] = 0
        venda['liquido'] = 0
        venda['comissao'] = 0

        x = 0
        for item in venda['ItensBase']:
            if not item['Cancelado']:
                # Variavel de calculo descartavel
                bruto = item['PrecoUnitario'] * item['Quantidade']
                desconto = item['DescontoDigitado'] + item['DescontoProporcional']
                liquido = bruto - desconto

                # Gerando totais nos totalizadores gerais
                venda['bruto'] = bruto + venda['bruto']
                venda['desconto'] = desconto + venda['desconto']
                venda['liquido'] = liquido + venda['liquido']

                # Gerando totais do item
                venda['ItensBase'][x]['desconto_total'] = desconto
                venda['ItensBase'][x]['bruto'] = bruto

                # Verificando se existe vendedor para criar comissão
                if 'Vendedor' in venda:
                    # Calculando comissão
                    if venda['Vendedor']['Vendedor']['Comissao']['_t'] == 'TotalVenda' and \
                            venda['Vendedor']['Vendedor']['BaseCalculoComissao'] == 0:
                        comissao_venda = bruto * venda['Vendedor']['Vendedor']['PercentualComissao'] / 100

                    elif venda['Vendedor']['Vendedor']['Comissao']['_t'] == 'TotalVenda' and \
                            venda['Vendedor']['Vendedor']['BaseCalculoComissao'] == 1:
                        comissao_venda = liquido * venda['Vendedor']['Vendedor']['PercentualComissao'] / 100
                    else:
                        comissao_venda = bruto * venda['Vendedor']['Vendedor']['PercentualComissao'] / 100

                    venda['comissao'] = venda['comissao'] + comissao_venda
            x = x+1

        venda['bruto_extenso'] = self.num_to_currency(venda['bruto'])
        venda['desconto_extenso'] = self.num_to_currency(venda['desconto'])
        venda['liquido_extenso'] = self.num_to_currency(venda['liquido'])
        venda['comissao_extenso'] = self.num_to_currency(venda['comissao'])
        return venda

    def totais(self, vendas):
        totais_vendas = {
            'bruto': 0,
            'desconto': 0,
            'liquido': 0,
            'comissao': 0,
            'vendas': []
        }

        for venda in vendas:
            venda = self.total_venda(venda)
            totais_vendas['vendas'].append(venda)
            totais_vendas['bruto'] = totais_vendas['bruto'] + venda['bruto']
            totais_vendas['desconto'] = totais_vendas['desconto'] + venda['desconto']
            totais_vendas['liquido'] = totais_vendas['liquido'] + venda['liquido']
            totais_vendas['comissao'] = totais_vendas['comissao'] + venda['comissao']

        totais_vendas['bruto_extenso'] = self.num_to_currency(totais_vendas['bruto'])
        totais_vendas['desconto_extenso'] = self.num_to_currency(totais_vendas['desconto'])
        totais_vendas['liquido_extenso'] = self.num_to_currency(totais_vendas['liquido'])
        totais_vendas['comissao_extenso'] = self.num_to_currency(totais_vendas['comissao'])
        return totais_vendas

    @staticmethod
    def remover_totais(venda):
        del venda['bruto']
        del venda['liquido']
        del venda['desconto']
        del venda['comissao']

        for item in venda['ItensBase']:
            if 'desconto_total' in item:
                del item['desconto_total']

            if 'bruto' in item:
                del item['bruto']

        return venda


class Configuracoes:
    @staticmethod
    def configuracoes():
        # Importe Uteis para criar conexao com mongo
        database = Uteis().conexao

        # Setando coletion que vai ser consultado
        collection = database['Configuracoes']

        query = {}
        retorno = collection.find_one(query)
        Uteis().fecha_conexao()
        return retorno

    @staticmethod
    def ultimo_numero():
        # Importe Uteis para criar conexao com mongo
        database = Uteis().conexao

        # Setando coletion que vai ser consultado
        collection = database['SequenciasMovimentacoes']

        query = {'_t.1': 'SequenciaNotaManual', '_t.0': 'SequenciaMovimentacao', 'Ativo': True}
        retorno = collection.find_one(query)
        Uteis().fecha_conexao()
        return retorno

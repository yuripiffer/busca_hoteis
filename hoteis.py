import MySQLdb
import pandas as pd

pd.set_option('display.max_columns', None)


class ConnectDB():
    def __init__(self, db_name: str, user="root", host="localhost", port=3306):
        self.db_name = db_name
        self.user = user
        self.host = host
        self.port = port
        self.conexao = MySQLdb.connect(db=self.db_name, user=self.user, host=self.host, port=self.port)
        self.cursor = self.conexao.cursor()

    def read_filtro(self, dict_filtros: dict):
        filtros = ""
        for k, v in dict_filtros.items():
            if k == "preco_diaria":
                filtros += f" and {k} < {v} "
            else:
                filtros += f" and {k} = {v} "

        comando = f"""select * from hoteis
            join cidades on hoteis.id_cidade_hoteis = cidades.id_cidade
            join estado on cidades.id_regiao_cidades = estado.id_regiao
            where hoteis.vagas > 0 
            {filtros} 
            order by hoteis.classificacao DESC
            limit 10"""

        self.cursor.execute(comando)
        self.conexao.commit()
        lista_nomes_colunas = []
        for col in self.cursor.description:
            lista_nomes_colunas.append(col[0])
        df = pd.DataFrame(self.cursor.fetchall(), columns=lista_nomes_colunas)
        df.drop(["id_hotel", "id_cidade", "id_regiao", "id_regiao_cidades", "id_cidade_hoteis"], axis=1, inplace=True)
        print(df)


testeDB = ConnectDB(db_name="hoteis_regioes")
testeDB.read_filtro(dict(piscina=0))

import abc

import pymssql
from dbutils.persistent_db import PersistentDB



class DAO(metaclass=abc.ABCMeta):
    @abc.abstractmethod
    def get_conn(cls):
        pass
    @abc.abstractmethod
    def get_cursor(cls):
        pass

class Base_DAO(DAO):
    POLL = PersistentDB(creator=pymssql,maxusage=10,closeable=False,threadlocal=None,host='127.0.0.1',user='sa',password='123456',port='1433',database='education',charset='utf8')

    @classmethod
    def get_conn(cls):
        return cls.POLL.connection()
    @classmethod
    def close_conn(cls,conn):
        conn.close()







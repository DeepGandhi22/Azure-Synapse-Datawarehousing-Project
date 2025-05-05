CREATE DATABASE SCOPED CREDENTIAL deep_creds
WITH IDENTITY = 'Managed Identity'

CREATE EXTERNAL DATA SOURCE silver_source
WITH
(
    LOCATION = 'https://syndatala.dfs.core.windows.net/silver/',
    CREDENTIAL = deep_creds
)

CREATE EXTERNAL DATA SOURCE gold_source
WITH
(
    LOCATION = 'https://syndatala.dfs.core.windows.net/gold/',
    CREDENTIAL = deep_creds
)

CREATE EXTERNAL FILE FORMAT parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

CREATE EXTERNAL FILE FORMAT delta
WITH
(
    FORMAT_TYPE = DELTA
)

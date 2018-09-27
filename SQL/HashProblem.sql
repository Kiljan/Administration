USE [XXXX]


--CREATE FUNCTION dbo.GetHash(
--@algorithm NVARCHAR(4000),
--@input VARBINARY(max)
--)
--RETURNS VARBINARY(max)
--AS 
--EXTERNAL NAME NewCoding.HashUtil.GetHash



DECLARE @INPUT VARCHAR(MAX)= NULL;
SET @INPUT = 'lolo'
SELECT master.sys.fn_repl_hash_binary(CAST(@INPUT AS varbinary))
SELECT dbo.GetHash('MD5',CONVERT(VARBINARY(MAX),@INPUT));
SELECT HASHBYTES ('md5',  @INPUT)


DECLARE @value varbinary(max)
SET @value  = cast(replicate('a', 8000) as varbinary(max)) + 0x60 --dodanie jednego bitu do ciągu
SELECT master.sys.fn_repl_hash_binary(@value)
SELECT dbo.GetHash('MD5',@value);
SELECT HASHBYTES ('md5',  @value)

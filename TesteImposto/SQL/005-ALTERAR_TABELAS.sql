if not exists(select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[NotaFiscalItem]') and name = 'BaseCalculoIpi')
begin
	alter table NotaFiscalItem
	add BaseCalculoIpi decimal(18,5)
end

if not exists(select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[NotaFiscalItem]') and name = 'AliquotaIpi')
begin
	alter table NotaFiscalItem
	add AliquotaIpi decimal(18,5)
end

if not exists(select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[NotaFiscalItem]') and name = 'ValorIpi')
begin
	alter table NotaFiscalItem
	add ValorIpi decimal(18,5)
end

if not exists(select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[NotaFiscalItem]') and name = 'Desconto')
begin
	alter table NotaFiscalItem
	add Desconto decimal(18,5)
end
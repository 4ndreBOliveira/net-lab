USE [Teste]
GO
/****** Object:  StoredProcedure [dbo].[P_NOTA_FISCAL_ITEM]    Script Date: 22/05/2016 10:03:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[P_NOTA_FISCAL_ITEM]
(
	@pId int,
    @pIdNotaFiscal int,
    @pCfop varchar(5),
    @pTipoIcms varchar(20),
    @pBaseIcms decimal(18,5),
    @pAliquotaIcms decimal(18,5),
    @pValorIcms decimal(18,5),
	@pBaseCalculoIpi decimal(18,5),
	@pAliquotaIpi decimal(18,5),
	@pValorIpi decimal(18,5),
	@pDesconto decimal(18,5),
    @pNomeProduto varchar(50),
    @pCodigoProduto varchar(20)
)
AS
BEGIN
	IF (@pId = 0)
	BEGIN 		
		INSERT INTO [dbo].[NotaFiscalItem]
           ([IdNotaFiscal]
           ,[Cfop]
           ,[TipoIcms]
           ,[BaseIcms]
           ,[AliquotaIcms]
           ,[ValorIcms]
		   ,[ValorIpi]
		   ,[BaseCalculoIpi]
		   ,[AliquotaIpi]
		   ,[Desconto]
           ,[NomeProduto]
           ,[CodigoProduto])
		VALUES
           (@pIdNotaFiscal,
			@pCfop,
			@pTipoIcms,
			@pBaseIcms,
			@pAliquotaIcms,
			@pValorIcms,
			@pValorIpi,
			@pBaseCalculoIpi,
			@pAliquotaIpi,
			@pDesconto,
			@pNomeProduto,
			@pCodigoProduto)

		SET @pId = @@IDENTITY
	END
	ELSE
	BEGIN
		UPDATE [dbo].[NotaFiscalItem]
		SET [IdNotaFiscal] = @pIdNotaFiscal
			,[Cfop] = @pCfop
			,[TipoIcms] = @pTipoIcms
			,[BaseIcms] = @pBaseIcms
			,[AliquotaIcms] = @pAliquotaIcms
			,[ValorIcms] = @pValorIcms
			,[ValorIpi] = @pValorIpi
		    ,[BaseCalculoIpi] = @pBaseCalculoIpi
		    ,[AliquotaIpi] = @pAliquotaIpi
			,[Desconto] = @pDesconto
			,[NomeProduto] = @pNomeProduto
			,[CodigoProduto] = @pCodigoProduto
		 WHERE Id = @pId
	END	    
END

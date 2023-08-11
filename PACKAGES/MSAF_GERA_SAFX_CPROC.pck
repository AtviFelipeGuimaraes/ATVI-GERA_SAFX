CREATE OR REPLACE PACKAGE MSAF_GERA_SAFX_CPROC IS


  --==============================================================================================
  --== Autor    : Felipe Guimaraes                                                              ==
  --== Criaçao  : 15/09/2021                                                                    ==
  --== Empresa  : Atvi Consultoria                                                              ==
  --== Objetivo : Exportar registros de tabelas definitivas para SAFX manualmente               ==
  --==          : Utilizamos os objetos standard do taxone para exportacao                      ==
  --==          : Futuras manutencoes podem ser necessárias caso hajam mudanças nesses objetos  ==
  --==============================================================================================


  FUNCTION GERA_SAFX07(P_LINHA_X07  X07_DOCTO_FISCAL%ROWTYPE DEFAULT NULL
                        , P_BY_ROWID VARCHAR2 DEFAULT 'N'
                        , P_ROWID    ROWID    DEFAULT NULL
                        , P_PROCESSO NUMBER) RETURN ROWID;


  FUNCTION GERA_SAFX08(P_LINHA_X08  X08_ITENS_MERC%ROWTYPE DEFAULT NULL
                        , P_BY_ROWID VARCHAR2 DEFAULT 'N'
                        , P_ROWID    ROWID    DEFAULT NULL
                        , P_PROCESSO NUMBER) RETURN ROWID;
                        

  FUNCTION GERA_SAFX09(P_LINHA_X09  X09_ITENS_SERV%ROWTYPE DEFAULT NULL
                        , P_BY_ROWID VARCHAR2 DEFAULT 'N'
                        , P_ROWID    ROWID    DEFAULT NULL
                        , P_PROCESSO NUMBER) RETURN ROWID;
                        
  FUNCTION GERA_SAFX10(P_LINHA_X10  X10_ESTOQUE%ROWTYPE DEFAULT NULL
                        , P_BY_ROWID VARCHAR2 DEFAULT 'N'
                        , P_ROWID    ROWID    DEFAULT NULL
                        , P_PROCESSO NUMBER) RETURN ROWID;
                        
  FUNCTION GERA_SAFX112(P_LINHA_X112  X112_OBS_DOCFIS%ROWTYPE DEFAULT NULL
                        , P_BY_ROWID VARCHAR2 DEFAULT 'N'
                        , P_ROWID    ROWID    DEFAULT NULL
                        , P_PROCESSO NUMBER) RETURN ROWID;
                        
  FUNCTION GERA_SAFX113(P_LINHA_X113  X113_AJUSTE_APUR%ROWTYPE DEFAULT NULL
                        , P_BY_ROWID VARCHAR2 DEFAULT 'N'
                        , P_ROWID    ROWID    DEFAULT NULL
                        , P_PROCESSO NUMBER) RETURN ROWID;
                        
  FUNCTION GERA_SAFX116(P_LINHA_X116  X116_DOCFIS_REF%ROWTYPE DEFAULT NULL
                        , P_BY_ROWID VARCHAR2 DEFAULT 'N'
                        , P_ROWID    ROWID    DEFAULT NULL
                        , P_PROCESSO NUMBER) RETURN ROWID;
                        
  FUNCTION GERA_SAFX2013(P_LINHA_X2013  X2013_PRODUTO%ROWTYPE DEFAULT NULL
                        , P_BY_ROWID VARCHAR2 DEFAULT 'N'
                        , P_ROWID    ROWID    DEFAULT NULL
                        , P_PROCESSO NUMBER) RETURN ROWID;
                        
  PROCEDURE P_LIMPA_SAFX(P_SAFX      VARCHAR2
                        , P_PROCESSO NUMBER
                        , P_DATA_INI DATE DEFAULT NULL
                        , P_DATA_FIM DATE DEFAULT NULL
                        , P_IND_UTIL_DATA VARCHAR2 DEFAULT 'N'
                        , P_COL_FIL_DATA  VARCHAR2 DEFAULT NULL);
                         
  PROCEDURE P_GERA_DYN_TXT(P_SAFX             VARCHAR2
                           , P_PROCESSO       NUMBER
                           , P_USUARIO        VARCHAR2
                           , P_EMPRESA        VARCHAR2
                           , P_ESTAB          VARCHAR2
                           , P_DATA_INI       DATE
                           , P_DATA_FIM       DATE
                           , P_QTD_ARQ        NUMBER DEFAULT 1
                           , P_IND_UTIL_DATA  VARCHAR2 DEFAULT 'N'
                           , P_COL_FIL_DATA   VARCHAR2 DEFAULT NULL);
                        
  /*PROCEDURE IMPORTA_SAFX (PCOD_EMPRESA VARCHAR2
                          , PCOD_ESTAB   VARCHAR2
                          , PDATA_INI    DATE
                          , PDATA_FIM    DATE
                          , PUSUARIO     VARCHAR2
                          , PTABELA      VARCHAR2);*/
                          


END;
/
CREATE OR REPLACE PACKAGE BODY MSAF_GERA_SAFX_CPROC IS

  --==============================================================================================
  --== AUTOR    : FELIPE GUIMARAES                                                              ==
  --== CRIAÇAO  : 15/09/2021                                                                    ==
  --== EMPRESA  : ATVI CONSULTORIA                                                              ==
  --== OBJETIVO : EXPORTAR REGISTROS DE TABELAS DEFINITIVAS PARA SAFX MANUALMENTE               ==
  --==          : UTILIZAMOS OS OBJETOS STANDARD DO TAXONE PARA EXPORTACAO                      ==
  --==          : FUTURAS MANUTENCOES PODEM SER NECESSÁRIAS CASO HAJAM MUDANÇAS NESSES OBJETOS  ==
  --==============================================================================================


  VS_LINHA LONG;
  
  FUNCTION F_TRATA_CAMPO(P_CAMPO VARCHAR2, P_CONTEUDO VARCHAR2)
    RETURN VARCHAR2 IS
    
    BEGIN
     IF
       P_CAMPO IN ('COD_BEM','COD_INC_BEM') AND NVL(TRIM(P_CONTEUDO),0) = 0
        THEN RETURN '@';
     ELSE
       RETURN P_CONTEUDO;
     END IF;
     
     IF
       P_CAMPO IN ('IND_ATO_COTEPE') AND NVL(TRIM(P_CONTEUDO),0) = 0
        THEN RETURN 'N';
     ELSE
       RETURN P_CONTEUDO;
     END IF;
          
    END;
    
    
/*  FUNCTION F_TRATA_CAMPO(P_CAMPO VARCHAR2, P_CONTEUDO CHAR)
    RETURN VARCHAR2 IS
    
    BEGIN
     IF
       P_CAMPO = 'COD_BEM' AND NVL(TRIM(P_CONTEUDO),0) = 0
        THEN RETURN ' ';
     END IF;
    END;  */  

  FUNCTION GERA_SAFX07(P_LINHA_X07  X07_DOCTO_FISCAL%ROWTYPE DEFAULT NULL
                        , P_BY_ROWID VARCHAR2 DEFAULT 'N'
                        , P_ROWID    ROWID    DEFAULT NULL
                        , P_PROCESSO NUMBER) RETURN ROWID IS
    
  VR_X07    X07_DOCTO_FISCAL%ROWTYPE;
  V_ROWID_RETORNO ROWID;

  BEGIN
    IF
      (P_BY_ROWID = 'S' AND P_ROWID IS NOT NULL) THEN -- RECUPERAR REGISTRO PELO ROWID
      
      BEGIN
        SELECT *
               INTO   VR_X07
               FROM X07_DOCTO_FISCAL
        WHERE ROWID = P_ROWID;
        

         -- FORMATA REGISTRO PARA LINHA SAFX07
         VS_LINHA := MSAF_EXPORTA_NOTA_CPROC.X07(VR_X07.COD_EMPRESA,
                                         VR_X07.COD_ESTAB,
                                         VR_X07.DATA_FISCAL,
                                         VR_X07.MOVTO_E_S,
                                         VR_X07.NORM_DEV,
                                         VR_X07.IDENT_DOCTO,
                                         VR_X07.IDENT_FIS_JUR,
                                         VR_X07.NUM_DOCFIS,
                                         VR_X07.SERIE_DOCFIS,
                                         VR_X07.SUB_SERIE_DOCFIS,
                                         VR_X07.DATA_EMISSAO,
                                         VR_X07.COD_CLASS_DOC_FIS,
                                         VR_X07.IDENT_MODELO,
                                         VR_X07.IDENT_CFO,
                                         VR_X07.IDENT_NATUREZA_OP,
                                         VR_X07.NUM_DOCFIS_REF,
                                         VR_X07.SERIE_DOCFIS_REF,
                                         VR_X07.S_SER_DOCFIS_REF,
                                         VR_X07.NUM_DEC_IMP_REF,
                                         VR_X07.DATA_SAIDA_REC,
                                         VR_X07.INSC_ESTAD_SUBSTIT,
                                         VR_X07.VLR_PRODUTO,
                                         VR_X07.VLR_TOT_NOTA,
                                         VR_X07.VLR_FRETE,
                                         VR_X07.VLR_SEGURO,
                                         VR_X07.VLR_OUTRAS,
                                         VR_X07.VLR_BASE_DIF_FRETE,
                                         VR_X07.VLR_DESCONTO,
                                         VR_X07.CONTRIB_FINAL,
                                         VR_X07.SITUACAO,
                                         VR_X07.COD_INDICE,
                                         VR_X07.VLR_NOTA_CONV,
                                         VR_X07.IDENT_CONTA,
                                         VR_X07.IND_MODELO_CUPOM,
                                         VR_X07.NUM_PROCESSO,
                                         VR_X07.IND_GRAVACAO,
                                         VR_X07.VLR_CONTAB_COMPL,
                                         VR_X07.NUM_CONTROLE_DOCTO,
                                         VR_X07.VLR_ALIQ_DESTINO,
                                         VR_X07.VLR_OUTROS1,
                                         VR_X07.VLR_OUTROS2,
                                         VR_X07.VLR_OUTROS3,
                                         VR_X07.VLR_OUTROS4,
                                         VR_X07.VLR_OUTROS5,
                                         VR_X07.VLR_ALIQ_OUTROS1,
                                         VR_X07.VLR_ALIQ_OUTROS2,
                                         VR_X07.IND_NF_ESPECIAL,
                                         VR_X07.IND_TP_FRETE,
                                         VR_X07.COD_MUNICIPIO,
                                         VR_X07.IND_TRANSF_CRED,
                                         VR_X07.DAT_DI,
                                         VR_X07.VLR_TOM_SERVICO,
                                         VR_X07.DAT_ESCR_EXTEMP,
                                         VR_X07.COD_TRIB_INT,
                                         VR_X07.COD_REGIAO,
                                         VR_X07.DAT_AUTENTIC,
                                         VR_X07.COD_CANAL_DISTRIB,
                                         VR_X07.VLR_ICMS_NDESTAC,
                                         VR_X07.VLR_IPI_NDESTAC,
                                         VR_X07.VLR_BASE_INSS,
                                         VR_X07.VLR_ALIQ_INSS,
                                         VR_X07.VLR_INSS_RETIDO,
                                         VR_X07.VLR_MAT_APLIC_ISS,
                                         VR_X07.VLR_SUBEMPR_ISS,
                                         VR_X07.IND_MUNIC_ISS,
                                         VR_X07.IND_CLASSE_OP_ISS,
                                         VR_X07.DAT_FATO_GERADOR,
                                         VR_X07.DAT_CANCELAMENTO,
                                         VR_X07.NUM_PAGINA,
                                         VR_X07.NUM_LIVRO,
                                         VR_X07.NRO_AIDF_NF,
                                         VR_X07.DAT_VALID_DOC_AIDF,
                                         VR_X07.IND_FATURA,
                                         VR_X07.IDENT_QUITACAO,
                                         VR_X07.NUM_SELO_CONT_ICMS,
                                         VR_X07.VLR_BASE_PIS,
                                         VR_X07.VLR_PIS,
                                         VR_X07.VLR_BASE_COFINS,
                                         VR_X07.VLR_COFINS,
                                         VR_X07.BASE_ICMS_ORIGDEST,
                                         VR_X07.VLR_ICMS_ORIGDEST,
                                         VR_X07.ALIQ_ICMS_ORIGDEST,
                                         VR_X07.VLR_DESC_CONDIC,
                                         VR_X07.PERC_RED_BASE_ICMS,
                                         VR_X07.IDENT_FISJUR_CPDIR,
                                         VR_X07.IND_MEDIDAJUDICIAL,
                                         VR_X07.IDENT_UF_ORIG_DEST,
                                         VR_X07.IND_COMPRA_VENDA,
                                         VR_X07.COD_TP_DISP_SEG,
                                         VR_X07.NUM_CTR_DISP,
                                         VR_X07.NUM_FIM_DOCTO,
                                         VR_X07.IDENT_UF_DESTINO,
                                         VR_X07.SERIE_CTR_DISP,
                                         VR_X07.SUB_SERIE_CTR_DISP,
                                         VR_X07.IND_SITUACAO_ESP,
                                         VR_X07.INSC_ESTADUAL,
                                         VR_X07.COD_PAGTO_INSS,
                                         VR_X07.DAT_OPERACAO,
                                         VR_X07.USUARIO,
                                         VR_X07.DAT_INTERN_AM,
                                         VR_X07.IDENT_FISJUR_LSG,
                                         VR_X07.COMPROV_EXP,
                                         VR_X07.NUM_FINAL_CRT_DISP,
                                         VR_X07.NUM_ALVARA,
                                         VR_X07.NOTIFICA_SEFAZ,
                                         VR_X07.INTERNA_SUFRAMA,
                                         VR_X07.COD_AMPARO,
                                         VR_X07.IDENT_ESTADO_AMPAR,
                                         VR_X07.IND_NOTA_SERVICO,
                                         VR_X07.COD_MOTIVO,
                                         VR_X07.OBS_COMPL_MOTIVO,
                                         VR_X07.IND_TP_RET,
                                         VR_X07.IND_TP_TOMADOR,
                                         VR_X07.COD_ANTEC_ST,
                                         VR_X07.CNPJ_ARMAZ_ORIG,
                                         VR_X07.IDENT_UF_ARMAZ_ORIG,
                                         VR_X07.INS_EST_ARMAZ_ORIG,
                                         VR_X07.CNPJ_ARMAZ_DEST,
                                         VR_X07.IDENT_UF_ARMAZ_DEST,
                                         VR_X07.INS_EST_ARMAZ_DEST,
                                         VR_X07.OBS_INF_ADIC_NF,
                                         VR_X07.VLR_BASE_INSS_2,
                                         VR_X07.VLR_ALIQ_INSS_2,
                                         VR_X07.VLR_INSS_RETIDO_2,
                                         VR_X07.COD_PAGTO_INSS_2,
                                         VR_X07.VLR_BASE_PIS_ST,
                                         VR_X07.VLR_ALIQ_PIS_ST,
                                         VR_X07.VLR_PIS_ST,
                                         VR_X07.VLR_BASE_COFINS_ST,
                                         VR_X07.VLR_ALIQ_COFINS_ST,
                                         VR_X07.VLR_COFINS_ST,
                                         VR_X07.VLR_BASE_CSLL,
                                         VR_X07.VLR_ALIQ_CSLL,
                                         VR_X07.VLR_CSLL,
                                         VR_X07.VLR_ALIQ_PIS,
                                         VR_X07.VLR_ALIQ_COFINS,
                                         VR_X07.BASE_ICMSS_SUBSTITUIDO,
                                         VR_X07.VLR_ICMSS_SUBSTITUIDO,
                                         VR_X07.IND_SITUACAO_ESP_ST,
                                         VR_X07.VLR_ICMSS_NDESTAC,
                                         VR_X07.IND_DOCTO_REC,
                                         VR_X07.DAT_PGTO_GNRE_DARJ,
                                         VR_X07.COD_CEI,
                                         VR_X07.VLR_JUROS_INSS,
                                         VR_X07.VLR_MULTA_INSS,
                                         VR_X07.DT_PAGTO_NF,
                                         VR_X07.IND_ORIGEM_INFO,
                                         VR_X07.HORA_SAIDA,
                                         VR_X07.COD_SIT_DOCFIS,
                                         VR_X07.IDENT_OBSERVACAO,
                                         VR_X07.IDENT_SITUACAO_A,
                                         VR_X07.IDENT_SITUACAO_B,
                                         VR_X07.NUM_CICLO,
                                         VR_X07.COD_MUNICIPIO_ORIG,
                                         VR_X07.COD_MUNICIPIO_DEST,
                                         VR_X07.COD_CFPS,
                                         VR_X07.NUM_LANCAMENTO,
                                         VR_X07.VLR_MAT_PROP,
                                         VR_X07.VLR_MAT_TERC,
                                         VR_X07.VLR_BASE_ISS_RETIDO,
                                         VR_X07.VLR_ISS_RETIDO,
                                         VR_X07.VLR_DEDUCAO_ISS,
                                         VR_X07.COD_MUNIC_ARMAZ_ORIG,
                                         VR_X07.INS_MUNIC_ARMAZ_ORIG,
                                         VR_X07.COD_MUNIC_ARMAZ_DEST,
                                         VR_X07.INS_MUNIC_ARMAZ_DEST,
                                         VR_X07.IDENT_CLASSE_CONSUMO,
                                         VR_X07.IND_ESPECIF_RECEITA,
                                         VR_X07.NUM_CONTRATO,
                                         VR_X07.COD_AREA_TERMINAL,
                                         VR_X07.COD_TP_UTIL,
                                         VR_X07.GRUPO_TENSAO,
                                         VR_X07.DATA_CONSUMO_INI,
                                         VR_X07.DATA_CONSUMO_FIM,
                                         VR_X07.DATA_CONSUMO_LEIT,
                                         VR_X07.QTD_CONTRATADA_PONTA,
                                         VR_X07.QTD_CONTRATADA_FPONTA,
                                         VR_X07.QTD_CONSUMO_TOTAL,
                                         VR_X07.IDENT_UF_CONSUMO,
                                         VR_X07.COD_MUNIC_CONSUMO,
                                         VR_X07.COD_OPER_ESP_ST,
                                         VR_X07.ATO_NORMATIVO,
                                         VR_X07.NUM_ATO_NORMATIVO,
                                         VR_X07.ANO_ATO_NORMATIVO,
                                         VR_X07.CAPITULACAO_NORMA,
                                         VR_X07.VLR_OUTRAS_ENTID,
                                         VR_X07.VLR_TERCEIROS,
                                         VR_X07.IND_TP_COMPL_ICMS,
                                         VR_X07.VLR_BASE_CIDE,
                                         VR_X07.VLR_ALIQ_CIDE,
                                         VR_X07.VLR_CIDE,
                                         VR_X07.COD_VERIFIC_NFE,
                                         VR_X07.COD_TP_RPS_NFE,
                                         VR_X07.NUM_RPS_NFE,
                                         VR_X07.SERIE_RPS_NFE,
                                         VR_X07.DAT_EMISSAO_RPS_NFE,
                                         VR_X07.DSC_SERVICO_NFE,
                                         VR_X07.NUM_AUTENTIC_NFE,
                                         VR_X07.NUM_DV_NFE,
                                         VR_X07.MODELO_NF_DMS,
                                         VR_X07.COD_MODELO_COTEPE,
                                         VR_X07.VLR_COMISSAO,
                                         VR_X07.IND_NFE_DENEG_INUT,
                                         VR_X07.IND_NF_REG_ESPECIAL,
                                         VR_X07.VLR_ABAT_NTRIBUTADO,
                                         VR_X07.VLR_OUTROS_ICMS,
                                         VR_X07.HORA_EMISSAO,
                                         VR_X07.OBS_DADOS_FATURA,
                                         VR_X07.IDENT_FIS_CONCES,
                                         VR_X07.COD_AUTENTIC,
                                         VR_X07.IND_PORT_CAT44,
                                         VR_X07.VLR_BASE_INSS_RURAL,
                                         VR_X07.VLR_ALIQ_INSS_RURAL,
                                         VR_X07.VLR_INSS_RURAL,
                                         VR_X07.IDENT_CLASSE_CONSUMO_SEF_PE,
                                         VR_X07.VLR_PIS_RETIDO,
                                         VR_X07.VLR_COFINS_RETIDO,
                                         VR_X07.DAT_LANC_PIS_COFINS,
                                         VR_X07.IND_PIS_COFINS_EXTEMP,
                                         VR_X07.COD_SIT_PIS,
                                         VR_X07.COD_SIT_COFINS,
                                         VR_X07.IND_NAT_FRETE,
                                         VR_X07.COD_NAT_REC,
                                         VR_X07.IND_VENDA_CANC,
                                         VR_X07.IND_NAT_BASE_CRED,
                                         VR_X07.IND_NF_CONTINGENCIA,
                                         VR_X07.VLR_ACRESCIMO,
                                         VR_X07.VLR_ANTECIP_TRIB,
                                         VR_X07.DSC_RESERVADO1,
                                         VR_X07.DSC_RESERVADO2,
                                         VR_X07.DSC_RESERVADO3,
                                         VR_X07.NUM_NFTS,
                                         VR_X07.IND_NF_VENDA_TERCEIROS,
                                         VR_X07.DSC_RESERVADO4,
                                         VR_X07.DSC_RESERVADO5,
                                         VR_X07.DSC_RESERVADO6,
                                         VR_X07.DSC_RESERVADO7,
                                         VR_X07.DSC_RESERVADO8,
                                         VR_X07.IDENTIF_DOCFIS,
                                         VR_X07.COD_SISTEMA_ORIG,
                                         VR_X07.IDENT_SCP,
                                         VR_X07.IND_PREST_SERV,
                                         VR_X07.IND_TIPO_PROC,
                                         VR_X07.NUM_PROC_JUR,
                                         VR_X07.IND_DEC_PROC,
                                         VR_X07.IND_TIPO_AQUIS,
                                         VR_X07.VLR_DESC_GILRAT,
                                         VR_X07.VLR_DESC_SENAR,
                                         VR_X07.CNPJ_SUBEMPREITEIRO,
                                         VR_X07.CNPJ_CPF_PROPRIETARIO_CNO,
                                         VR_X07.VLR_RET_SUBEMPREITADO,
                                         VR_X07.NUM_DOCFIS_SERV,
                                         VR_X07.VLR_FCP_UF_DEST,
                                         VR_X07.VLR_ICMS_UF_DEST,
                                         VR_X07.VLR_ICMS_UF_ORIG,
                                         VR_X07.VLR_CONTRIB_PREV,
                                         VR_X07.VLR_GILRAT,
                                         VR_X07.VLR_CONTRIB_SENAR,
                                         VR_X07.CPF_CNPJ,
                                         VR_X07.NUM_CERTIF_QUAL,
                                         VR_X07.OBS_REINF,
                                         VR_X07.VLR_TOT_ADIC,
                                         VR_X07.VLR_RET_SERV,
                                         VR_X07.VLR_SERV_15,
                                         VR_X07.VLR_SERV_20,
                                         VR_X07.VLR_SERV_25,
                                         VR_X07.VLR_IPI_DEV,
                                         VR_X07.VLR_SEST,
                                         VR_X07.VLR_SENAT,
                                         VR_X07.IND_FIN_EMISSAO_NFE,
                                         VR_X07.NUM_AUTENTIC_NFE_SUBST,
                                         VR_X07.IND_VLR_ICMS_COB_ANT_ST);

        
        EXCEPTION
          WHEN OTHERS THEN
            LIB_PROC.ADD_LOG('Erro ao recuperar "rowid" da X07_DOCTO_FISCAL, registro não será gerado: '||P_ROWID,1);
      END;
      
      
    ELSIF (P_BY_ROWID = 'N' AND P_LINHA_X07.COD_EMPRESA IS NOT NULL) THEN -- GERA POR REGISTRO ROWTYPE
      
         -- FORMATA REGISTRO PARA LINHA SAFX07
         VS_LINHA := MSAF_EXPORTA_NOTA_CPROC.X07(P_LINHA_X07.COD_EMPRESA,
                                         P_LINHA_X07.COD_ESTAB,
                                         P_LINHA_X07.DATA_FISCAL,
                                         P_LINHA_X07.MOVTO_E_S,
                                         P_LINHA_X07.NORM_DEV,
                                         P_LINHA_X07.IDENT_DOCTO,
                                         P_LINHA_X07.IDENT_FIS_JUR,
                                         P_LINHA_X07.NUM_DOCFIS,
                                         P_LINHA_X07.SERIE_DOCFIS,
                                         P_LINHA_X07.SUB_SERIE_DOCFIS,
                                         P_LINHA_X07.DATA_EMISSAO,
                                         P_LINHA_X07.COD_CLASS_DOC_FIS,
                                         P_LINHA_X07.IDENT_MODELO,
                                         P_LINHA_X07.IDENT_CFO,
                                         P_LINHA_X07.IDENT_NATUREZA_OP,
                                         P_LINHA_X07.NUM_DOCFIS_REF,
                                         P_LINHA_X07.SERIE_DOCFIS_REF,
                                         P_LINHA_X07.S_SER_DOCFIS_REF,
                                         P_LINHA_X07.NUM_DEC_IMP_REF,
                                         P_LINHA_X07.DATA_SAIDA_REC,
                                         P_LINHA_X07.INSC_ESTAD_SUBSTIT,
                                         P_LINHA_X07.VLR_PRODUTO,
                                         P_LINHA_X07.VLR_TOT_NOTA,
                                         P_LINHA_X07.VLR_FRETE,
                                         P_LINHA_X07.VLR_SEGURO,
                                         P_LINHA_X07.VLR_OUTRAS,
                                         P_LINHA_X07.VLR_BASE_DIF_FRETE,
                                         P_LINHA_X07.VLR_DESCONTO,
                                         P_LINHA_X07.CONTRIB_FINAL,
                                         P_LINHA_X07.SITUACAO,
                                         P_LINHA_X07.COD_INDICE,
                                         P_LINHA_X07.VLR_NOTA_CONV,
                                         P_LINHA_X07.IDENT_CONTA,
                                         P_LINHA_X07.IND_MODELO_CUPOM,
                                         P_LINHA_X07.NUM_PROCESSO,
                                         P_LINHA_X07.IND_GRAVACAO,
                                         P_LINHA_X07.VLR_CONTAB_COMPL,
                                         P_LINHA_X07.NUM_CONTROLE_DOCTO,
                                         P_LINHA_X07.VLR_ALIQ_DESTINO,
                                         P_LINHA_X07.VLR_OUTROS1,
                                         P_LINHA_X07.VLR_OUTROS2,
                                         P_LINHA_X07.VLR_OUTROS3,
                                         P_LINHA_X07.VLR_OUTROS4,
                                         P_LINHA_X07.VLR_OUTROS5,
                                         P_LINHA_X07.VLR_ALIQ_OUTROS1,
                                         P_LINHA_X07.VLR_ALIQ_OUTROS2,
                                         P_LINHA_X07.IND_NF_ESPECIAL,
                                         P_LINHA_X07.IND_TP_FRETE,
                                         P_LINHA_X07.COD_MUNICIPIO,
                                         P_LINHA_X07.IND_TRANSF_CRED,
                                         P_LINHA_X07.DAT_DI,
                                         P_LINHA_X07.VLR_TOM_SERVICO,
                                         P_LINHA_X07.DAT_ESCR_EXTEMP,
                                         P_LINHA_X07.COD_TRIB_INT,
                                         P_LINHA_X07.COD_REGIAO,
                                         P_LINHA_X07.DAT_AUTENTIC,
                                         P_LINHA_X07.COD_CANAL_DISTRIB,
                                         P_LINHA_X07.VLR_ICMS_NDESTAC,
                                         P_LINHA_X07.VLR_IPI_NDESTAC,
                                         P_LINHA_X07.VLR_BASE_INSS,
                                         P_LINHA_X07.VLR_ALIQ_INSS,
                                         P_LINHA_X07.VLR_INSS_RETIDO,
                                         P_LINHA_X07.VLR_MAT_APLIC_ISS,
                                         P_LINHA_X07.VLR_SUBEMPR_ISS,
                                         P_LINHA_X07.IND_MUNIC_ISS,
                                         P_LINHA_X07.IND_CLASSE_OP_ISS,
                                         P_LINHA_X07.DAT_FATO_GERADOR,
                                         P_LINHA_X07.DAT_CANCELAMENTO,
                                         P_LINHA_X07.NUM_PAGINA,
                                         P_LINHA_X07.NUM_LIVRO,
                                         P_LINHA_X07.NRO_AIDF_NF,
                                         P_LINHA_X07.DAT_VALID_DOC_AIDF,
                                         P_LINHA_X07.IND_FATURA,
                                         P_LINHA_X07.IDENT_QUITACAO,
                                         P_LINHA_X07.NUM_SELO_CONT_ICMS,
                                         P_LINHA_X07.VLR_BASE_PIS,
                                         P_LINHA_X07.VLR_PIS,
                                         P_LINHA_X07.VLR_BASE_COFINS,
                                         P_LINHA_X07.VLR_COFINS,
                                         P_LINHA_X07.BASE_ICMS_ORIGDEST,
                                         P_LINHA_X07.VLR_ICMS_ORIGDEST,
                                         P_LINHA_X07.ALIQ_ICMS_ORIGDEST,
                                         P_LINHA_X07.VLR_DESC_CONDIC,
                                         P_LINHA_X07.PERC_RED_BASE_ICMS,
                                         P_LINHA_X07.IDENT_FISJUR_CPDIR,
                                         P_LINHA_X07.IND_MEDIDAJUDICIAL,
                                         P_LINHA_X07.IDENT_UF_ORIG_DEST,
                                         P_LINHA_X07.IND_COMPRA_VENDA,
                                         P_LINHA_X07.COD_TP_DISP_SEG,
                                         P_LINHA_X07.NUM_CTR_DISP,
                                         P_LINHA_X07.NUM_FIM_DOCTO,
                                         P_LINHA_X07.IDENT_UF_DESTINO,
                                         P_LINHA_X07.SERIE_CTR_DISP,
                                         P_LINHA_X07.SUB_SERIE_CTR_DISP,
                                         P_LINHA_X07.IND_SITUACAO_ESP,
                                         P_LINHA_X07.INSC_ESTADUAL,
                                         P_LINHA_X07.COD_PAGTO_INSS,
                                         P_LINHA_X07.DAT_OPERACAO,
                                         P_LINHA_X07.USUARIO,
                                         P_LINHA_X07.DAT_INTERN_AM,
                                         P_LINHA_X07.IDENT_FISJUR_LSG,
                                         P_LINHA_X07.COMPROV_EXP,
                                         P_LINHA_X07.NUM_FINAL_CRT_DISP,
                                         P_LINHA_X07.NUM_ALVARA,
                                         P_LINHA_X07.NOTIFICA_SEFAZ,
                                         P_LINHA_X07.INTERNA_SUFRAMA,
                                         P_LINHA_X07.COD_AMPARO,
                                         P_LINHA_X07.IDENT_ESTADO_AMPAR,
                                         P_LINHA_X07.IND_NOTA_SERVICO,
                                         P_LINHA_X07.COD_MOTIVO,
                                         P_LINHA_X07.OBS_COMPL_MOTIVO,
                                         P_LINHA_X07.IND_TP_RET,
                                         P_LINHA_X07.IND_TP_TOMADOR,
                                         P_LINHA_X07.COD_ANTEC_ST,
                                         P_LINHA_X07.CNPJ_ARMAZ_ORIG,
                                         P_LINHA_X07.IDENT_UF_ARMAZ_ORIG,
                                         P_LINHA_X07.INS_EST_ARMAZ_ORIG,
                                         P_LINHA_X07.CNPJ_ARMAZ_DEST,
                                         P_LINHA_X07.IDENT_UF_ARMAZ_DEST,
                                         P_LINHA_X07.INS_EST_ARMAZ_DEST,
                                         P_LINHA_X07.OBS_INF_ADIC_NF,
                                         P_LINHA_X07.VLR_BASE_INSS_2,
                                         P_LINHA_X07.VLR_ALIQ_INSS_2,
                                         P_LINHA_X07.VLR_INSS_RETIDO_2,
                                         P_LINHA_X07.COD_PAGTO_INSS_2,
                                         P_LINHA_X07.VLR_BASE_PIS_ST,
                                         P_LINHA_X07.VLR_ALIQ_PIS_ST,
                                         P_LINHA_X07.VLR_PIS_ST,
                                         P_LINHA_X07.VLR_BASE_COFINS_ST,
                                         P_LINHA_X07.VLR_ALIQ_COFINS_ST,
                                         P_LINHA_X07.VLR_COFINS_ST,
                                         P_LINHA_X07.VLR_BASE_CSLL,
                                         P_LINHA_X07.VLR_ALIQ_CSLL,
                                         P_LINHA_X07.VLR_CSLL,
                                         P_LINHA_X07.VLR_ALIQ_PIS,
                                         P_LINHA_X07.VLR_ALIQ_COFINS,
                                         P_LINHA_X07.BASE_ICMSS_SUBSTITUIDO,
                                         P_LINHA_X07.VLR_ICMSS_SUBSTITUIDO,
                                         P_LINHA_X07.IND_SITUACAO_ESP_ST,
                                         P_LINHA_X07.VLR_ICMSS_NDESTAC,
                                         P_LINHA_X07.IND_DOCTO_REC,
                                         P_LINHA_X07.DAT_PGTO_GNRE_DARJ,
                                         P_LINHA_X07.COD_CEI,
                                         P_LINHA_X07.VLR_JUROS_INSS,
                                         P_LINHA_X07.VLR_MULTA_INSS,
                                         P_LINHA_X07.DT_PAGTO_NF,
                                         P_LINHA_X07.IND_ORIGEM_INFO,
                                         P_LINHA_X07.HORA_SAIDA,
                                         P_LINHA_X07.COD_SIT_DOCFIS,
                                         P_LINHA_X07.IDENT_OBSERVACAO,
                                         P_LINHA_X07.IDENT_SITUACAO_A,
                                         P_LINHA_X07.IDENT_SITUACAO_B,
                                         P_LINHA_X07.NUM_CICLO,
                                         P_LINHA_X07.COD_MUNICIPIO_ORIG,
                                         P_LINHA_X07.COD_MUNICIPIO_DEST,
                                         P_LINHA_X07.COD_CFPS,
                                         P_LINHA_X07.NUM_LANCAMENTO,
                                         P_LINHA_X07.VLR_MAT_PROP,
                                         P_LINHA_X07.VLR_MAT_TERC,
                                         P_LINHA_X07.VLR_BASE_ISS_RETIDO,
                                         P_LINHA_X07.VLR_ISS_RETIDO,
                                         P_LINHA_X07.VLR_DEDUCAO_ISS,
                                         P_LINHA_X07.COD_MUNIC_ARMAZ_ORIG,
                                         P_LINHA_X07.INS_MUNIC_ARMAZ_ORIG,
                                         P_LINHA_X07.COD_MUNIC_ARMAZ_DEST,
                                         P_LINHA_X07.INS_MUNIC_ARMAZ_DEST,
                                         P_LINHA_X07.IDENT_CLASSE_CONSUMO,
                                         P_LINHA_X07.IND_ESPECIF_RECEITA,
                                         P_LINHA_X07.NUM_CONTRATO,
                                         P_LINHA_X07.COD_AREA_TERMINAL,
                                         P_LINHA_X07.COD_TP_UTIL,
                                         P_LINHA_X07.GRUPO_TENSAO,
                                         P_LINHA_X07.DATA_CONSUMO_INI,
                                         P_LINHA_X07.DATA_CONSUMO_FIM,
                                         P_LINHA_X07.DATA_CONSUMO_LEIT,
                                         P_LINHA_X07.QTD_CONTRATADA_PONTA,
                                         P_LINHA_X07.QTD_CONTRATADA_FPONTA,
                                         P_LINHA_X07.QTD_CONSUMO_TOTAL,
                                         P_LINHA_X07.IDENT_UF_CONSUMO,
                                         P_LINHA_X07.COD_MUNIC_CONSUMO,
                                         P_LINHA_X07.COD_OPER_ESP_ST,
                                         P_LINHA_X07.ATO_NORMATIVO,
                                         P_LINHA_X07.NUM_ATO_NORMATIVO,
                                         P_LINHA_X07.ANO_ATO_NORMATIVO,
                                         P_LINHA_X07.CAPITULACAO_NORMA,
                                         P_LINHA_X07.VLR_OUTRAS_ENTID,
                                         P_LINHA_X07.VLR_TERCEIROS,
                                         P_LINHA_X07.IND_TP_COMPL_ICMS,
                                         P_LINHA_X07.VLR_BASE_CIDE,
                                         P_LINHA_X07.VLR_ALIQ_CIDE,
                                         P_LINHA_X07.VLR_CIDE,
                                         P_LINHA_X07.COD_VERIFIC_NFE,
                                         P_LINHA_X07.COD_TP_RPS_NFE,
                                         P_LINHA_X07.NUM_RPS_NFE,
                                         P_LINHA_X07.SERIE_RPS_NFE,
                                         P_LINHA_X07.DAT_EMISSAO_RPS_NFE,
                                         P_LINHA_X07.DSC_SERVICO_NFE,
                                         P_LINHA_X07.NUM_AUTENTIC_NFE,
                                         P_LINHA_X07.NUM_DV_NFE,
                                         P_LINHA_X07.MODELO_NF_DMS,
                                         P_LINHA_X07.COD_MODELO_COTEPE,
                                         P_LINHA_X07.VLR_COMISSAO,
                                         P_LINHA_X07.IND_NFE_DENEG_INUT,
                                         P_LINHA_X07.IND_NF_REG_ESPECIAL,
                                         P_LINHA_X07.VLR_ABAT_NTRIBUTADO,
                                         P_LINHA_X07.VLR_OUTROS_ICMS,
                                         P_LINHA_X07.HORA_EMISSAO,
                                         P_LINHA_X07.OBS_DADOS_FATURA,
                                         P_LINHA_X07.IDENT_FIS_CONCES,
                                         P_LINHA_X07.COD_AUTENTIC,
                                         P_LINHA_X07.IND_PORT_CAT44,
                                         P_LINHA_X07.VLR_BASE_INSS_RURAL,
                                         P_LINHA_X07.VLR_ALIQ_INSS_RURAL,
                                         P_LINHA_X07.VLR_INSS_RURAL,
                                         P_LINHA_X07.IDENT_CLASSE_CONSUMO_SEF_PE,
                                         P_LINHA_X07.VLR_PIS_RETIDO,
                                         P_LINHA_X07.VLR_COFINS_RETIDO,
                                         P_LINHA_X07.DAT_LANC_PIS_COFINS,
                                         P_LINHA_X07.IND_PIS_COFINS_EXTEMP,
                                         P_LINHA_X07.COD_SIT_PIS,
                                         P_LINHA_X07.COD_SIT_COFINS,
                                         P_LINHA_X07.IND_NAT_FRETE,
                                         P_LINHA_X07.COD_NAT_REC,
                                         P_LINHA_X07.IND_VENDA_CANC,
                                         P_LINHA_X07.IND_NAT_BASE_CRED,
                                         P_LINHA_X07.IND_NF_CONTINGENCIA,
                                         P_LINHA_X07.VLR_ACRESCIMO,
                                         P_LINHA_X07.VLR_ANTECIP_TRIB,
                                         P_LINHA_X07.DSC_RESERVADO1,
                                         P_LINHA_X07.DSC_RESERVADO2,
                                         P_LINHA_X07.DSC_RESERVADO3,
                                         P_LINHA_X07.NUM_NFTS,
                                         P_LINHA_X07.IND_NF_VENDA_TERCEIROS,
                                         P_LINHA_X07.DSC_RESERVADO4,
                                         P_LINHA_X07.DSC_RESERVADO5,
                                         P_LINHA_X07.DSC_RESERVADO6,
                                         P_LINHA_X07.DSC_RESERVADO7,
                                         P_LINHA_X07.DSC_RESERVADO8,
                                         P_LINHA_X07.IDENTIF_DOCFIS,
                                         P_LINHA_X07.COD_SISTEMA_ORIG,
                                         P_LINHA_X07.IDENT_SCP,
                                         P_LINHA_X07.IND_PREST_SERV,
                                         P_LINHA_X07.IND_TIPO_PROC,
                                         P_LINHA_X07.NUM_PROC_JUR,
                                         P_LINHA_X07.IND_DEC_PROC,
                                         P_LINHA_X07.IND_TIPO_AQUIS,
                                         P_LINHA_X07.VLR_DESC_GILRAT,
                                         P_LINHA_X07.VLR_DESC_SENAR,
                                         P_LINHA_X07.CNPJ_SUBEMPREITEIRO,
                                         P_LINHA_X07.CNPJ_CPF_PROPRIETARIO_CNO,
                                         P_LINHA_X07.VLR_RET_SUBEMPREITADO,
                                         P_LINHA_X07.NUM_DOCFIS_SERV,
                                         P_LINHA_X07.VLR_FCP_UF_DEST,
                                         P_LINHA_X07.VLR_ICMS_UF_DEST,
                                         P_LINHA_X07.VLR_ICMS_UF_ORIG,
                                         P_LINHA_X07.VLR_CONTRIB_PREV,
                                         P_LINHA_X07.VLR_GILRAT,
                                         P_LINHA_X07.VLR_CONTRIB_SENAR,
                                         P_LINHA_X07.CPF_CNPJ,
                                         P_LINHA_X07.NUM_CERTIF_QUAL,
                                         P_LINHA_X07.OBS_REINF,
                                         P_LINHA_X07.VLR_TOT_ADIC,
                                         P_LINHA_X07.VLR_RET_SERV,
                                         P_LINHA_X07.VLR_SERV_15,
                                         P_LINHA_X07.VLR_SERV_20,
                                         P_LINHA_X07.VLR_SERV_25,
                                         P_LINHA_X07.VLR_IPI_DEV,
                                         P_LINHA_X07.VLR_SEST,
                                         P_LINHA_X07.VLR_SENAT,
                                         P_LINHA_X07.IND_FIN_EMISSAO_NFE,
                                         P_LINHA_X07.NUM_AUTENTIC_NFE_SUBST,
                                         P_LINHA_X07.IND_VLR_ICMS_COB_ANT_ST);
                                         
     ELSE
       LIB_PROC.ADD_LOG('Erro ao gerar registro da SAFX07: Informe um registro ou um rowid para geração',1);
    END IF;
    
    
    IF TRIM(VS_LINHA) IS NOT NULL
      THEN
        
         --REALIZA O INSERT DA LINHA NA TABELA SAFX07
         V_ROWID_RETORNO := MSAF_EXPORTA_NOTA_CPROC.INSERT_LINE_SAFX07(VS_LINHA, P_PROCESSO);
         
    END IF;
    
    COMMIT;
    
    RETURN V_ROWID_RETORNO;
    
  END;
  
  
  FUNCTION GERA_SAFX08(P_LINHA_X08  X08_ITENS_MERC%ROWTYPE DEFAULT NULL
                        , P_BY_ROWID VARCHAR2 DEFAULT 'N'
                        , P_ROWID    ROWID    DEFAULT NULL
                        , P_PROCESSO NUMBER) RETURN ROWID IS
    
  VR_X08    X08_ITENS_MERC%ROWTYPE;
  V_ROWID_RETORNO ROWID;


  BEGIN
    IF
      (P_BY_ROWID = 'S' AND P_ROWID IS NOT NULL) THEN -- RECUPERAR REGISTRO PELO ROWID
      
      BEGIN
        SELECT *
               INTO   VR_X08
               FROM   X08_ITENS_MERC
        WHERE ROWID = P_ROWID;
        

         -- FORMATA REGISTRO PARA LINHA SAFX08
             VS_LINHA := MSAF_EXPORTA_NOTA_CPROC.X08(VR_X08.COD_EMPRESA,
                                             VR_X08.COD_ESTAB,
                                             VR_X08.DATA_FISCAL,
                                             VR_X08.MOVTO_E_S,
                                             VR_X08.NORM_DEV,
                                             VR_X08.IDENT_DOCTO,
                                             VR_X08.IDENT_FIS_JUR,
                                             VR_X08.NUM_DOCFIS,
                                             VR_X08.SERIE_DOCFIS,
                                             VR_X08.SUB_SERIE_DOCFIS,
                                             VR_X08.DISCRI_ITEM,
                                             VR_X08.IDENT_PRODUTO,
                                             VR_X08.IDENT_UND_PADRAO,
                                             VR_X08.COD_BEM,
                                             VR_X08.COD_INC_BEM,
                                             VR_X08.VALID_BEM,
                                             VR_X08.NUM_ITEM,
                                             VR_X08.IDENT_ALMOX,
                                             VR_X08.IDENT_CUSTO,
                                             VR_X08.DESCRICAO_COMPL,
                                             VR_X08.IDENT_CFO,
                                             VR_X08.IDENT_NATUREZA_OP,
                                             VR_X08.IDENT_NBM,
                                             VR_X08.QUANTIDADE,
                                             VR_X08.IDENT_MEDIDA,
                                             VR_X08.VLR_UNIT,
                                             VR_X08.VLR_ITEM,
                                             VR_X08.VLR_DESCONTO,
                                             VR_X08.VLR_FRETE,
                                             VR_X08.VLR_SEGURO,
                                             VR_X08.VLR_OUTRAS,
                                             VR_X08.IDENT_SITUACAO_A,
                                             VR_X08.IDENT_SITUACAO_B,
                                             VR_X08.IDENT_FEDERAL,
                                             VR_X08.IND_IPI_INCLUSO,
                                             VR_X08.NUM_ROMANEIO,
                                             VR_X08.DATA_ROMANEIO,
                                             VR_X08.PESO_LIQUIDO,
                                             VR_X08.COD_INDICE,
                                             VR_X08.VLR_ITEM_CONVER,
                                             VR_X08.NUM_PROCESSO,
                                             VR_X08.IND_GRAVACAO,
                                             VR_X08.VLR_CONTAB_COMPL,
                                             VR_X08.VLR_ALIQ_DESTINO,
                                             VR_X08.VLR_OUTROS1,
                                             VR_X08.VLR_OUTROS2,
                                             VR_X08.VLR_OUTROS3,
                                             VR_X08.VLR_OUTROS4,
                                             VR_X08.VLR_OUTROS5,
                                             VR_X08.VLR_ALIQ_OUTROS1,
                                             VR_X08.VLR_ALIQ_OUTROS2,
                                             VR_X08.VLR_CONTAB_ITEM,
                                             VR_X08.COD_OBS_VCONT_COMP,
                                             VR_X08.COD_OBS_VCONT_ITEM,
                                             VR_X08.VLR_OUTROS_ICMS,
                                             VR_X08.VLR_OUTROS_IPI,
                                             VR_X08.IND_RESP_VCONT_ITM,
                                             VR_X08.NUM_ATO_CONCES,
                                             VR_X08.DAT_EMBARQUE,
                                             VR_X08.NUM_REG_EXP,
                                             VR_X08.NUM_DESP_EXP,
                                             VR_X08.VLR_TOM_SERVICO,
                                             VR_X08.VLR_DESP_MOEDA_EXP,
                                             VR_X08.COD_MOEDA_NEGOC,
                                             VR_X08.COD_PAIS_DEST_ORIG,
                                             VR_X08.COD_TRIB_INT,
                                             VR_X08.VLR_ICMS_NDESTAC,
                                             VR_X08.VLR_IPI_NDESTAC,
                                             VR_X08.VLR_BASE_PIS,
                                             VR_X08.VLR_PIS,
                                             VR_X08.VLR_BASE_COFINS,
                                             VR_X08.VLR_COFINS,
                                             VR_X08.BASE_ICMS_ORIGDEST,
                                             VR_X08.VLR_ICMS_ORIGDEST,
                                             VR_X08.ALIQ_ICMS_ORIGDEST,
                                             VR_X08.VLR_DESC_CONDIC,
                                             VR_X08.VLR_CUSTO_TRANSF,
                                             VR_X08.PERC_RED_BASE_ICMS,
                                             VR_X08.QTD_EMBARCADA,
                                             VR_X08.DAT_REGISTRO_EXP,
                                             VR_X08.DAT_DESPACHO,
                                             VR_X08.DAT_AVERBACAO,
                                             VR_X08.DAT_DI,
                                             VR_X08.NUM_DEC_IMP_REF,
                                             VR_X08.DSC_MOT_OCOR,
                                             VR_X08.IDENT_CONTA,
                                             VR_X08.VLR_BASE_ICMS_ORIG,
                                             VR_X08.VLR_TRIB_ICMS_ORIG,
                                             VR_X08.VLR_BASE_ICMS_DEST,
                                             VR_X08.VLR_TRIB_ICMS_DEST,
                                             VR_X08.VLR_PERC_PRES_ICMS,
                                             VR_X08.VLR_PRECO_BASE_ST,
                                             VR_X08.IDENT_OPER_OIL,
                                             VR_X08.COD_DCR,
                                             VR_X08.IDENT_PROJETO,
                                             VR_X08.DAT_OPERACAO,
                                             VR_X08.USUARIO,
                                             VR_X08.IND_MOV_FIS,
                                             VR_X08.CHASSI,
                                             VR_X08.NUM_DOCFIS_REF,
                                             VR_X08.SERIE_DOCFIS_REF,
                                             VR_X08.SSERIE_DOCFIS_REF,
                                             VR_X08.VLR_BASE_PIS_ST,
                                             VR_X08.VLR_ALIQ_PIS_ST,
                                             VR_X08.VLR_PIS_ST,
                                             VR_X08.VLR_BASE_COFINS_ST,
                                             VR_X08.VLR_ALIQ_COFINS_ST,
                                             VR_X08.VLR_COFINS_ST,
                                             VR_X08.VLR_BASE_CSLL,
                                             VR_X08.VLR_ALIQ_CSLL,
                                             VR_X08.VLR_CSLL,
                                             VR_X08.VLR_ALIQ_PIS,
                                             VR_X08.VLR_ALIQ_COFINS,
                                             VR_X08.IND_SITUACAO_ESP_ST,
                                             VR_X08.VLR_ICMSS_NDESTAC,
                                             VR_X08.IND_DOCTO_REC,
                                             VR_X08.DAT_PGTO_GNRE_DARJ,
                                             VR_X08.VLR_CUSTO_UNIT,
                                             VR_X08.QUANTIDADE_CONV,
                                             VR_X08.VLR_FECP_ICMS,
                                             VR_X08.VLR_FECP_DIFALIQ,
                                             VR_X08.VLR_FECP_ICMS_ST,
                                             VR_X08.VLR_FECP_FONTE,
                                             VR_X08.VLR_BASE_ICMSS_N_ESCRIT,
                                             VR_X08.VLR_ICMSS_N_ESCRIT,
                                             VR_X08.COD_TRIB_IPI,
                                             VR_X08.LOTE_MEDICAMENTO,
                                             VR_X08.VALID_MEDICAMENTO,
                                             VR_X08.IND_BASE_MEDICAMENTO,
                                             VR_X08.VLR_PRECO_MEDICAMENTO,
                                             VR_X08.IND_TIPO_ARMA,
                                             VR_X08.NUM_SERIE_ARMA,
                                             VR_X08.NUM_CANO_ARMA,
                                             VR_X08.DSC_ARMA,
                                             VR_X08.IDENT_OBSERVACAO,
                                             VR_X08.COD_EX_NCM,
                                             VR_X08.COD_EX_IMP,
                                             VR_X08.CNPJ_OPERADORA,
                                             VR_X08.CPF_OPERADORA,
                                             VR_X08.IDENT_UF_OPERADORA,
                                             VR_X08.INS_EST_OPERADORA,
                                             VR_X08.IND_ESPECIF_RECEITA,
                                             VR_X08.COD_CLASS_ITEM,
                                             VR_X08.VLR_TERCEIROS,
                                             VR_X08.VLR_PRECO_SUGER,
                                             VR_X08.VLR_BASE_CIDE,
                                             VR_X08.VLR_ALIQ_CIDE,
                                             VR_X08.VLR_CIDE,
                                             VR_X08.COD_OPER_ESP_ST,
                                             VR_X08.VLR_COMISSAO,
                                             VR_X08.VLR_ICMS_FRETE,
                                             VR_X08.VLR_DIFAL_FRETE,
                                             VR_X08.IND_VLR_PIS_COFINS,
                                             VR_X08.COD_ENQUAD_IPI,
                                             VR_X08.COD_SITUACAO_PIS,
                                             VR_X08.QTD_BASE_PIS,
                                             VR_X08.VLR_ALIQ_PIS_R,
                                             VR_X08.COD_SITUACAO_COFINS,
                                             VR_X08.QTD_BASE_COFINS,
                                             VR_X08.VLR_ALIQ_COFINS_R,
                                             VR_X08.ITEM_PORT_TARE,
                                             VR_X08.VLR_FUNRURAL,
                                             VR_X08.IND_TP_PROD_MEDIC,
                                             VR_X08.VLR_CUSTO_DCA,
                                             VR_X08.COD_TP_LANCTO,
                                             VR_X08.VLR_PERC_CRED_OUT,
                                             VR_X08.VLR_CRED_OUT,
                                             VR_X08.VLR_ICMS_DCA,
                                             VR_X08.VLR_PIS_EXP,
                                             VR_X08.VLR_PIS_TRIB,
                                             VR_X08.VLR_PIS_N_TRIB,
                                             VR_X08.VLR_COFINS_EXP,
                                             VR_X08.VLR_COFINS_TRIB,
                                             VR_X08.VLR_COFINS_N_TRIB,
                                             VR_X08.COD_ENQ_LEGAL,
                                             VR_X08.IND_GRAVACAO_SAICS,
                                             VR_X08.DAT_LANC_PIS_COFINS,
                                             VR_X08.IND_PIS_COFINS_EXTEMP,
                                             VR_X08.IND_NATUREZA_FRETE,
                                             VR_X08.COD_NAT_REC,
                                             VR_X08.IND_NAT_BASE_CRED,
                                             VR_X08.VLR_ACRESCIMO,
                                             VR_X08.DSC_RESERVADO1,
                                             VR_X08.DSC_RESERVADO2,
                                             VR_X08.DSC_RESERVADO3,
                                             VR_X08.COD_TRIB_PROD,
                                             VR_X08.DSC_RESERVADO4,
                                             VR_X08.DSC_RESERVADO5,
                                             VR_X08.DSC_RESERVADO6,
                                             VR_X08.DSC_RESERVADO7,
                                             VR_X08.DSC_RESERVADO8,
                                             VR_X08.INDICE_PROD_ACAB,
                                             VR_X08.VLR_BASE_DIA_AM,
                                             VR_X08.VLR_ALIQ_DIA_AM,
                                             VR_X08.VLR_ICMS_DIA_AM,
                                             VR_X08.VLR_ADUANEIRO,
                                             VR_X08.COD_SITUACAO_PIS_ST,
                                             VR_X08.COD_SITUACAO_COFINS_ST,
                                             VR_X08.VLR_ALIQ_DCIP,
                                             VR_X08.NUM_LI,
                                             VR_X08.VLR_FCP_UF_DEST,
                                             VR_X08.VLR_ICMS_UF_DEST,
                                             VR_X08.VLR_ICMS_UF_ORIG,
                                             VR_X08.VLR_DIF_DUB,
                                             VR_X08.VLR_ICMS_NAO_DEST,
                                             VR_X08.VLR_BASE_ICMS_NAO_DEST,
                                             VR_X08.VLR_ALIQ_ICMS_NAO_DEST,
                                             VR_X08.IND_MOTIVO_RES,
                                             VR_X08.NUM_DOCFIS_RET,
                                             VR_X08.SERIE_DOCFIS_RET,
                                             VR_X08.NUM_AUTENTIC_NFE_RET,
                                             VR_X08.NUM_ITEM_RET,
                                             VR_X08.IDENT_FIS_JUR_RET,
                                             VR_X08.IND_TP_DOC_ARREC,
                                             VR_X08.NUM_DOC_ARREC,
                                             VR_X08.IDENT_CFO_DCIP,
                                             VR_X08.VLR_BASE_INSS,
                                             VR_X08.VLR_INSS_RETIDO,
                                             VR_X08.VLR_TOT_ADIC,
                                             VR_X08.VLR_N_RET_PRINC,
                                             VR_X08.VLR_N_RET_ADIC,
                                             VR_X08.VLR_ALIQ_INSS,
                                             VR_X08.VLR_RET_SERV,
                                             VR_X08.VLR_SERV_15,
                                             VR_X08.VLR_SERV_20,
                                             VR_X08.VLR_SERV_25,
                                             VR_X08.IND_TP_PROC_ADJ_PRINC,
                                             VR_X08.IDENT_PROC_ADJ_PRINC,
                                             VR_X08.IDENT_SUSP_TBT_PRINC,
                                             VR_X08.NUM_PROC_ADJ_PRINC,
                                             VR_X08.IND_TP_PROC_ADJ_ADIC,
                                             VR_X08.IDENT_PROC_ADJ_ADIC,
                                             VR_X08.IDENT_SUSP_TBT_ADIC,
                                             VR_X08.NUM_PROC_ADJ_ADIC,
                                             VR_X08.VLR_IPI_DEV,
                                             VR_X08.COD_BENEFICIO,
                                             VR_X08.VLR_ABAT_NTRIBUTADO,
                                             VR_X08.VLR_CREDITO_MVA_SN,
                                             VR_X08.VLR_DESONERADO_ICMS,
                                             VR_X08.VLR_DIFERIDO_ICMS,
                                             VR_X08.VLR_EXC_BC_PIS,
                                             VR_X08.VLR_EXC_BC_COFINS,
                                             VR_X08.COD_CSOSN,
                                             VR_X08.VLR_FECP_ALIQ_ICMS);

        
        EXCEPTION
          WHEN OTHERS THEN
            LIB_PROC.ADD_LOG('Erro ao recuperar "rowid" da X08_ITENS_MERC, registro não será gerado: '||P_ROWID,1);
      END;
      
      
    ELSIF (P_BY_ROWID = 'N' AND P_LINHA_X08.COD_EMPRESA IS NOT NULL) THEN -- GERA POR REGISTRO ROWTYPE
      
         -- FORMATA REGISTRO PARA LINHA SAFX08
             VS_LINHA := MSAF_EXPORTA_NOTA_CPROC.X08(P_LINHA_X08.COD_EMPRESA,
                                             P_LINHA_X08.COD_ESTAB,
                                             P_LINHA_X08.DATA_FISCAL,
                                             P_LINHA_X08.MOVTO_E_S,
                                             P_LINHA_X08.NORM_DEV,
                                             P_LINHA_X08.IDENT_DOCTO,
                                             P_LINHA_X08.IDENT_FIS_JUR,
                                             P_LINHA_X08.NUM_DOCFIS,
                                             P_LINHA_X08.SERIE_DOCFIS,
                                             P_LINHA_X08.SUB_SERIE_DOCFIS,
                                             P_LINHA_X08.DISCRI_ITEM,
                                             P_LINHA_X08.IDENT_PRODUTO,
                                             P_LINHA_X08.IDENT_UND_PADRAO,
                                             P_LINHA_X08.COD_BEM,
                                             P_LINHA_X08.COD_INC_BEM,
                                             P_LINHA_X08.VALID_BEM,
                                             P_LINHA_X08.NUM_ITEM,
                                             P_LINHA_X08.IDENT_ALMOX,
                                             P_LINHA_X08.IDENT_CUSTO,
                                             P_LINHA_X08.DESCRICAO_COMPL,
                                             P_LINHA_X08.IDENT_CFO,
                                             P_LINHA_X08.IDENT_NATUREZA_OP,
                                             P_LINHA_X08.IDENT_NBM,
                                             P_LINHA_X08.QUANTIDADE,
                                             P_LINHA_X08.IDENT_MEDIDA,
                                             P_LINHA_X08.VLR_UNIT,
                                             P_LINHA_X08.VLR_ITEM,
                                             P_LINHA_X08.VLR_DESCONTO,
                                             P_LINHA_X08.VLR_FRETE,
                                             P_LINHA_X08.VLR_SEGURO,
                                             P_LINHA_X08.VLR_OUTRAS,
                                             P_LINHA_X08.IDENT_SITUACAO_A,
                                             P_LINHA_X08.IDENT_SITUACAO_B,
                                             P_LINHA_X08.IDENT_FEDERAL,
                                             P_LINHA_X08.IND_IPI_INCLUSO,
                                             P_LINHA_X08.NUM_ROMANEIO,
                                             P_LINHA_X08.DATA_ROMANEIO,
                                             P_LINHA_X08.PESO_LIQUIDO,
                                             P_LINHA_X08.COD_INDICE,
                                             P_LINHA_X08.VLR_ITEM_CONVER,
                                             P_LINHA_X08.NUM_PROCESSO,
                                             P_LINHA_X08.IND_GRAVACAO,
                                             P_LINHA_X08.VLR_CONTAB_COMPL,
                                             P_LINHA_X08.VLR_ALIQ_DESTINO,
                                             P_LINHA_X08.VLR_OUTROS1,
                                             P_LINHA_X08.VLR_OUTROS2,
                                             P_LINHA_X08.VLR_OUTROS3,
                                             P_LINHA_X08.VLR_OUTROS4,
                                             P_LINHA_X08.VLR_OUTROS5,
                                             P_LINHA_X08.VLR_ALIQ_OUTROS1,
                                             P_LINHA_X08.VLR_ALIQ_OUTROS2,
                                             P_LINHA_X08.VLR_CONTAB_ITEM,
                                             P_LINHA_X08.COD_OBS_VCONT_COMP,
                                             P_LINHA_X08.COD_OBS_VCONT_ITEM,
                                             P_LINHA_X08.VLR_OUTROS_ICMS,
                                             P_LINHA_X08.VLR_OUTROS_IPI,
                                             P_LINHA_X08.IND_RESP_VCONT_ITM,
                                             P_LINHA_X08.NUM_ATO_CONCES,
                                             P_LINHA_X08.DAT_EMBARQUE,
                                             P_LINHA_X08.NUM_REG_EXP,
                                             P_LINHA_X08.NUM_DESP_EXP,
                                             P_LINHA_X08.VLR_TOM_SERVICO,
                                             P_LINHA_X08.VLR_DESP_MOEDA_EXP,
                                             P_LINHA_X08.COD_MOEDA_NEGOC,
                                             P_LINHA_X08.COD_PAIS_DEST_ORIG,
                                             P_LINHA_X08.COD_TRIB_INT,
                                             P_LINHA_X08.VLR_ICMS_NDESTAC,
                                             P_LINHA_X08.VLR_IPI_NDESTAC,
                                             P_LINHA_X08.VLR_BASE_PIS,
                                             P_LINHA_X08.VLR_PIS,
                                             P_LINHA_X08.VLR_BASE_COFINS,
                                             P_LINHA_X08.VLR_COFINS,
                                             P_LINHA_X08.BASE_ICMS_ORIGDEST,
                                             P_LINHA_X08.VLR_ICMS_ORIGDEST,
                                             P_LINHA_X08.ALIQ_ICMS_ORIGDEST,
                                             P_LINHA_X08.VLR_DESC_CONDIC,
                                             P_LINHA_X08.VLR_CUSTO_TRANSF,
                                             P_LINHA_X08.PERC_RED_BASE_ICMS,
                                             P_LINHA_X08.QTD_EMBARCADA,
                                             P_LINHA_X08.DAT_REGISTRO_EXP,
                                             P_LINHA_X08.DAT_DESPACHO,
                                             P_LINHA_X08.DAT_AVERBACAO,
                                             P_LINHA_X08.DAT_DI,
                                             P_LINHA_X08.NUM_DEC_IMP_REF,
                                             P_LINHA_X08.DSC_MOT_OCOR,
                                             P_LINHA_X08.IDENT_CONTA,
                                             P_LINHA_X08.VLR_BASE_ICMS_ORIG,
                                             P_LINHA_X08.VLR_TRIB_ICMS_ORIG,
                                             P_LINHA_X08.VLR_BASE_ICMS_DEST,
                                             P_LINHA_X08.VLR_TRIB_ICMS_DEST,
                                             P_LINHA_X08.VLR_PERC_PRES_ICMS,
                                             P_LINHA_X08.VLR_PRECO_BASE_ST,
                                             P_LINHA_X08.IDENT_OPER_OIL,
                                             P_LINHA_X08.COD_DCR,
                                             P_LINHA_X08.IDENT_PROJETO,
                                             P_LINHA_X08.DAT_OPERACAO,
                                             P_LINHA_X08.USUARIO,
                                             P_LINHA_X08.IND_MOV_FIS,
                                             P_LINHA_X08.CHASSI,
                                             P_LINHA_X08.NUM_DOCFIS_REF,
                                             P_LINHA_X08.SERIE_DOCFIS_REF,
                                             P_LINHA_X08.SSERIE_DOCFIS_REF,
                                             P_LINHA_X08.VLR_BASE_PIS_ST,
                                             P_LINHA_X08.VLR_ALIQ_PIS_ST,
                                             P_LINHA_X08.VLR_PIS_ST,
                                             P_LINHA_X08.VLR_BASE_COFINS_ST,
                                             P_LINHA_X08.VLR_ALIQ_COFINS_ST,
                                             P_LINHA_X08.VLR_COFINS_ST,
                                             P_LINHA_X08.VLR_BASE_CSLL,
                                             P_LINHA_X08.VLR_ALIQ_CSLL,
                                             P_LINHA_X08.VLR_CSLL,
                                             P_LINHA_X08.VLR_ALIQ_PIS,
                                             P_LINHA_X08.VLR_ALIQ_COFINS,
                                             P_LINHA_X08.IND_SITUACAO_ESP_ST,
                                             P_LINHA_X08.VLR_ICMSS_NDESTAC,
                                             P_LINHA_X08.IND_DOCTO_REC,
                                             P_LINHA_X08.DAT_PGTO_GNRE_DARJ,
                                             P_LINHA_X08.VLR_CUSTO_UNIT,
                                             P_LINHA_X08.QUANTIDADE_CONV,
                                             P_LINHA_X08.VLR_FECP_ICMS,
                                             P_LINHA_X08.VLR_FECP_DIFALIQ,
                                             P_LINHA_X08.VLR_FECP_ICMS_ST,
                                             P_LINHA_X08.VLR_FECP_FONTE,
                                             P_LINHA_X08.VLR_BASE_ICMSS_N_ESCRIT,
                                             P_LINHA_X08.VLR_ICMSS_N_ESCRIT,
                                             P_LINHA_X08.COD_TRIB_IPI,
                                             P_LINHA_X08.LOTE_MEDICAMENTO,
                                             P_LINHA_X08.VALID_MEDICAMENTO,
                                             P_LINHA_X08.IND_BASE_MEDICAMENTO,
                                             P_LINHA_X08.VLR_PRECO_MEDICAMENTO,
                                             P_LINHA_X08.IND_TIPO_ARMA,
                                             P_LINHA_X08.NUM_SERIE_ARMA,
                                             P_LINHA_X08.NUM_CANO_ARMA,
                                             P_LINHA_X08.DSC_ARMA,
                                             P_LINHA_X08.IDENT_OBSERVACAO,
                                             P_LINHA_X08.COD_EX_NCM,
                                             P_LINHA_X08.COD_EX_IMP,
                                             P_LINHA_X08.CNPJ_OPERADORA,
                                             P_LINHA_X08.CPF_OPERADORA,
                                             P_LINHA_X08.IDENT_UF_OPERADORA,
                                             P_LINHA_X08.INS_EST_OPERADORA,
                                             P_LINHA_X08.IND_ESPECIF_RECEITA,
                                             P_LINHA_X08.COD_CLASS_ITEM,
                                             P_LINHA_X08.VLR_TERCEIROS,
                                             P_LINHA_X08.VLR_PRECO_SUGER,
                                             P_LINHA_X08.VLR_BASE_CIDE,
                                             P_LINHA_X08.VLR_ALIQ_CIDE,
                                             P_LINHA_X08.VLR_CIDE,
                                             P_LINHA_X08.COD_OPER_ESP_ST,
                                             P_LINHA_X08.VLR_COMISSAO,
                                             P_LINHA_X08.VLR_ICMS_FRETE,
                                             P_LINHA_X08.VLR_DIFAL_FRETE,
                                             P_LINHA_X08.IND_VLR_PIS_COFINS,
                                             P_LINHA_X08.COD_ENQUAD_IPI,
                                             P_LINHA_X08.COD_SITUACAO_PIS,
                                             P_LINHA_X08.QTD_BASE_PIS,
                                             P_LINHA_X08.VLR_ALIQ_PIS_R,
                                             P_LINHA_X08.COD_SITUACAO_COFINS,
                                             P_LINHA_X08.QTD_BASE_COFINS,
                                             P_LINHA_X08.VLR_ALIQ_COFINS_R,
                                             P_LINHA_X08.ITEM_PORT_TARE,
                                             P_LINHA_X08.VLR_FUNRURAL,
                                             P_LINHA_X08.IND_TP_PROD_MEDIC,
                                             P_LINHA_X08.VLR_CUSTO_DCA,
                                             P_LINHA_X08.COD_TP_LANCTO,
                                             P_LINHA_X08.VLR_PERC_CRED_OUT,
                                             P_LINHA_X08.VLR_CRED_OUT,
                                             P_LINHA_X08.VLR_ICMS_DCA,
                                             P_LINHA_X08.VLR_PIS_EXP,
                                             P_LINHA_X08.VLR_PIS_TRIB,
                                             P_LINHA_X08.VLR_PIS_N_TRIB,
                                             P_LINHA_X08.VLR_COFINS_EXP,
                                             P_LINHA_X08.VLR_COFINS_TRIB,
                                             P_LINHA_X08.VLR_COFINS_N_TRIB,
                                             P_LINHA_X08.COD_ENQ_LEGAL,
                                             P_LINHA_X08.IND_GRAVACAO_SAICS,
                                             P_LINHA_X08.DAT_LANC_PIS_COFINS,
                                             P_LINHA_X08.IND_PIS_COFINS_EXTEMP,
                                             P_LINHA_X08.IND_NATUREZA_FRETE,
                                             P_LINHA_X08.COD_NAT_REC,
                                             P_LINHA_X08.IND_NAT_BASE_CRED,
                                             P_LINHA_X08.VLR_ACRESCIMO,
                                             P_LINHA_X08.DSC_RESERVADO1,
                                             P_LINHA_X08.DSC_RESERVADO2,
                                             P_LINHA_X08.DSC_RESERVADO3,
                                             P_LINHA_X08.COD_TRIB_PROD,
                                             P_LINHA_X08.DSC_RESERVADO4,
                                             P_LINHA_X08.DSC_RESERVADO5,
                                             P_LINHA_X08.DSC_RESERVADO6,
                                             P_LINHA_X08.DSC_RESERVADO7,
                                             P_LINHA_X08.DSC_RESERVADO8,
                                             P_LINHA_X08.INDICE_PROD_ACAB,
                                             P_LINHA_X08.VLR_BASE_DIA_AM,
                                             P_LINHA_X08.VLR_ALIQ_DIA_AM,
                                             P_LINHA_X08.VLR_ICMS_DIA_AM,
                                             P_LINHA_X08.VLR_ADUANEIRO,
                                             P_LINHA_X08.COD_SITUACAO_PIS_ST,
                                             P_LINHA_X08.COD_SITUACAO_COFINS_ST,
                                             P_LINHA_X08.VLR_ALIQ_DCIP,
                                             P_LINHA_X08.NUM_LI,
                                             P_LINHA_X08.VLR_FCP_UF_DEST,
                                             P_LINHA_X08.VLR_ICMS_UF_DEST,
                                             P_LINHA_X08.VLR_ICMS_UF_ORIG,
                                             P_LINHA_X08.VLR_DIF_DUB,
                                             P_LINHA_X08.VLR_ICMS_NAO_DEST,
                                             P_LINHA_X08.VLR_BASE_ICMS_NAO_DEST,
                                             P_LINHA_X08.VLR_ALIQ_ICMS_NAO_DEST,
                                             P_LINHA_X08.IND_MOTIVO_RES,
                                             P_LINHA_X08.NUM_DOCFIS_RET,
                                             P_LINHA_X08.SERIE_DOCFIS_RET,
                                             P_LINHA_X08.NUM_AUTENTIC_NFE_RET,
                                             P_LINHA_X08.NUM_ITEM_RET,
                                             P_LINHA_X08.IDENT_FIS_JUR_RET,
                                             P_LINHA_X08.IND_TP_DOC_ARREC,
                                             P_LINHA_X08.NUM_DOC_ARREC,
                                             P_LINHA_X08.IDENT_CFO_DCIP,
                                             P_LINHA_X08.VLR_BASE_INSS,
                                             P_LINHA_X08.VLR_INSS_RETIDO,
                                             P_LINHA_X08.VLR_TOT_ADIC,
                                             P_LINHA_X08.VLR_N_RET_PRINC,
                                             P_LINHA_X08.VLR_N_RET_ADIC,
                                             P_LINHA_X08.VLR_ALIQ_INSS,
                                             P_LINHA_X08.VLR_RET_SERV,
                                             P_LINHA_X08.VLR_SERV_15,
                                             P_LINHA_X08.VLR_SERV_20,
                                             P_LINHA_X08.VLR_SERV_25,
                                             P_LINHA_X08.IND_TP_PROC_ADJ_PRINC,
                                             P_LINHA_X08.IDENT_PROC_ADJ_PRINC,
                                             P_LINHA_X08.IDENT_SUSP_TBT_PRINC,
                                             P_LINHA_X08.NUM_PROC_ADJ_PRINC,
                                             P_LINHA_X08.IND_TP_PROC_ADJ_ADIC,
                                             P_LINHA_X08.IDENT_PROC_ADJ_ADIC,
                                             P_LINHA_X08.IDENT_SUSP_TBT_ADIC,
                                             P_LINHA_X08.NUM_PROC_ADJ_ADIC,
                                             P_LINHA_X08.VLR_IPI_DEV,
                                             P_LINHA_X08.COD_BENEFICIO,
                                             P_LINHA_X08.VLR_ABAT_NTRIBUTADO,
                                             P_LINHA_X08.VLR_CREDITO_MVA_SN,
                                             P_LINHA_X08.VLR_DESONERADO_ICMS,
                                             P_LINHA_X08.VLR_DIFERIDO_ICMS,
                                             P_LINHA_X08.VLR_EXC_BC_PIS,
                                             P_LINHA_X08.VLR_EXC_BC_COFINS,
                                             P_LINHA_X08.COD_CSOSN,
                                             P_LINHA_X08.VLR_FECP_ALIQ_ICMS);
                                         
     ELSE
       LIB_PROC.ADD_LOG('Erro ao gerar registro da SAFX08: Informe um registro ou um rowid para geração',1);
    END IF;
    
    
    IF TRIM(VS_LINHA) IS NOT NULL
      THEN
        
         --REALIZA O INSERT DA LINHA NA TABELA SAFX08
         V_ROWID_RETORNO:= MSAF_EXPORTA_NOTA_CPROC.INSERT_LINE_SAFX08(VS_LINHA, P_PROCESSO);
         
    END IF;
    
    COMMIT;
    
       RETURN V_ROWID_RETORNO;
    
  END;
  
  
  FUNCTION GERA_SAFX09(P_LINHA_X09  X09_ITENS_SERV%ROWTYPE DEFAULT NULL
                        , P_BY_ROWID VARCHAR2 DEFAULT 'N'
                        , P_ROWID    ROWID    DEFAULT NULL
                        , P_PROCESSO NUMBER) RETURN ROWID IS
    
  VR_X09    X09_ITENS_SERV%ROWTYPE;
  V_ROWID_RETORNO ROWID;
  

  BEGIN
    IF
      (P_BY_ROWID = 'S' AND P_ROWID IS NOT NULL) THEN -- RECUPERAR REGISTRO PELO ROWID
      
      BEGIN
        SELECT *
               INTO   VR_X09
               FROM   X09_ITENS_SERV
        WHERE ROWID = P_ROWID;
        

         -- FORMATA REGISTRO PARA LINHA SAFX09
             VS_LINHA := MSAF_EXPORTA_NOTA_CPROC.X09(VR_X09.COD_EMPRESA,
                                             VR_X09.COD_ESTAB,
                                             VR_X09.DATA_FISCAL,
                                             VR_X09.MOVTO_E_S,
                                             VR_X09.NORM_DEV,
                                             VR_X09.IDENT_DOCTO,
                                             VR_X09.IDENT_FIS_JUR,
                                             VR_X09.NUM_DOCFIS,
                                             VR_X09.SERIE_DOCFIS,
                                             VR_X09.SUB_SERIE_DOCFIS,
                                             VR_X09.IDENT_SERVICO,
                                             VR_X09.NUM_ITEM,
                                             VR_X09.DESCRICAO_COMPL,
                                             VR_X09.IDENT_CFO,
                                             VR_X09.IDENT_NATUREZA_OP,
                                             VR_X09.QUANTIDADE,
                                             VR_X09.VLR_UNIT,
                                             VR_X09.VLR_SERVICO,
                                             VR_X09.VLR_DESCONTO,
                                             VR_X09.VLR_TOT,
                                             VR_X09.CONTRATO,
                                             VR_X09.COD_INDICE,
                                             VR_X09.VLR_SERVICO_CONV,
                                             VR_X09.NUM_PROCESSO,
                                             VR_X09.IND_GRAVACAO,
                                             VR_X09.IDENT_PRODUTO,
                                             VR_X09.DAT_OPERACAO,
                                             VR_X09.USUARIO,
                                             VR_X09.COMPL_ISENCAO,
                                             VR_X09.VLR_BASE_CSLL,
                                             VR_X09.VLR_ALIQ_CSLL,
                                             VR_X09.VLR_CSLL,
                                             VR_X09.VLR_BASE_PIS,
                                             VR_X09.VLR_ALIQ_PIS,
                                             VR_X09.VLR_PIS,
                                             VR_X09.VLR_BASE_COFINS,
                                             VR_X09.VLR_ALIQ_COFINS,
                                             VR_X09.VLR_COFINS,
                                             VR_X09.IDENT_CONTA,
                                             VR_X09.IDENT_OBSERVACAO,
                                             VR_X09.COD_TRIB_ISS,
                                             VR_X09.VLR_MAT_PROP,
                                             VR_X09.VLR_MAT_TERC,
                                             VR_X09.VLR_BASE_ISS_RETIDO,
                                             VR_X09.VLR_ISS_RETIDO,
                                             VR_X09.VLR_DEDUCAO_ISS,
                                             VR_X09.VLR_SUBEMPR_ISS,
                                             VR_X09.COD_CFPS,
                                             VR_X09.VLR_OUT_DESP,
                                             VR_X09.VLR_BASE_CIDE,
                                             VR_X09.VLR_ALIQ_CIDE,
                                             VR_X09.VLR_CIDE,
                                             VR_X09.VLR_COMISSAO,
                                             VR_X09.IND_VLR_PIS_COFINS,
                                             VR_X09.COD_SITUACAO_PIS,
                                             VR_X09.COD_SITUACAO_COFINS,
                                             VR_X09.VLR_PIS_EXP,
                                             VR_X09.VLR_PIS_TRIB,
                                             VR_X09.VLR_PIS_N_TRIB,
                                             VR_X09.VLR_COFINS_EXP,
                                             VR_X09.VLR_COFINS_TRIB,
                                             VR_X09.VLR_COFINS_N_TRIB,
                                             VR_X09.VLR_PIS_RETIDO,
                                             VR_X09.VLR_COFINS_RETIDO,
                                             VR_X09.DAT_LANC_PIS_COFINS,
                                             VR_X09.IND_PIS_COFINS_EXTEMP,
                                             VR_X09.IND_LOCAL_EXEC_SERV,
                                             VR_X09.IDENT_CUSTO,
                                             VR_X09.VLR_BASE_INSS,
                                             VR_X09.VLR_ALIQ_INSS,
                                             VR_X09.VLR_INSS_RETIDO,
                                             VR_X09.COD_NAT_REC,
                                             VR_X09.IND_NAT_BASE_CRED,
                                             VR_X09.VLR_ACRESCIMO,
                                             VR_X09.DSC_RESERVADO1,
                                             VR_X09.DSC_RESERVADO2,
                                             VR_X09.DSC_RESERVADO3,
                                             VR_X09.IDENT_NBS,
                                             VR_X09.VLR_TOT_ADIC,
                                             VR_X09.VLR_TOT_RET,
                                             VR_X09.VLR_DEDUCAO_NF,
                                             VR_X09.VLR_RET_NF,
                                             VR_X09.VLR_RET_SERV,
                                             VR_X09.VLR_ALIQ_ISS_RETIDO,
                                             VR_X09.COD_SIT_TRIB_ISS,
                                             VR_X09.VLR_N_RET_PRINC,
                                             VR_X09.VLR_N_RET_ADIC,
                                             VR_X09.VLR_DED_ALIM,
                                             VR_X09.VLR_DED_TRANS,
                                             VR_X09.IND_TP_PROC_ADJ_PRINC,
                                             VR_X09.IDENT_PROC_ADJ_PRINC,
                                             VR_X09.IDENT_SUSP_TBT_PRINC,
                                             VR_X09.IND_TP_PROC_ADJ_ADIC,
                                             VR_X09.IDENT_PROC_ADJ_ADIC,
                                             VR_X09.IDENT_SUSP_TBT_ADIC,
                                             VR_X09.VLR_SERV_15,
                                             VR_X09.VLR_SERV_20,
                                             VR_X09.VLR_SERV_25,
                                             VR_X09.VLR_ABAT_NTRIBUTADO,
                                             VR_X09.COD_ATIV_RJ,
                                             VR_X09.DSC_RESERVADO4,
                                             VR_X09.DSC_RESERVADO5,
                                             VR_X09.DSC_RESERVADO6,
                                             VR_X09.DSC_RESERVADO7,
                                             VR_X09.DSC_RESERVADO8);

        
        EXCEPTION
          WHEN OTHERS THEN
            LIB_PROC.ADD_LOG('Erro ao recuperar "rowid" da x09_itens_serv, registro não será gerado: '||P_ROWID,1);
      END;
      
      
    ELSIF (P_BY_ROWID = 'N' AND P_LINHA_X09.COD_EMPRESA IS NOT NULL) THEN -- GERA POR REGISTRO ROWTYPE
      
         -- FORMATA REGISTRO PARA LINHA SAFX09
             VS_LINHA := MSAF_EXPORTA_NOTA_CPROC.X09(P_LINHA_X09.COD_EMPRESA,
                                             P_LINHA_X09.COD_ESTAB,
                                             P_LINHA_X09.DATA_FISCAL,
                                             P_LINHA_X09.MOVTO_E_S,
                                             P_LINHA_X09.NORM_DEV,
                                             P_LINHA_X09.IDENT_DOCTO,
                                             P_LINHA_X09.IDENT_FIS_JUR,
                                             P_LINHA_X09.NUM_DOCFIS,
                                             P_LINHA_X09.SERIE_DOCFIS,
                                             P_LINHA_X09.SUB_SERIE_DOCFIS,
                                             P_LINHA_X09.IDENT_SERVICO,
                                             P_LINHA_X09.NUM_ITEM,
                                             P_LINHA_X09.DESCRICAO_COMPL,
                                             P_LINHA_X09.IDENT_CFO,
                                             P_LINHA_X09.IDENT_NATUREZA_OP,
                                             P_LINHA_X09.QUANTIDADE,
                                             P_LINHA_X09.VLR_UNIT,
                                             P_LINHA_X09.VLR_SERVICO,
                                             P_LINHA_X09.VLR_DESCONTO,
                                             P_LINHA_X09.VLR_TOT,
                                             P_LINHA_X09.CONTRATO,
                                             P_LINHA_X09.COD_INDICE,
                                             P_LINHA_X09.VLR_SERVICO_CONV,
                                             P_LINHA_X09.NUM_PROCESSO,
                                             P_LINHA_X09.IND_GRAVACAO,
                                             P_LINHA_X09.IDENT_PRODUTO,
                                             P_LINHA_X09.DAT_OPERACAO,
                                             P_LINHA_X09.USUARIO,
                                             P_LINHA_X09.COMPL_ISENCAO,
                                             P_LINHA_X09.VLR_BASE_CSLL,
                                             P_LINHA_X09.VLR_ALIQ_CSLL,
                                             P_LINHA_X09.VLR_CSLL,
                                             P_LINHA_X09.VLR_BASE_PIS,
                                             P_LINHA_X09.VLR_ALIQ_PIS,
                                             P_LINHA_X09.VLR_PIS,
                                             P_LINHA_X09.VLR_BASE_COFINS,
                                             P_LINHA_X09.VLR_ALIQ_COFINS,
                                             P_LINHA_X09.VLR_COFINS,
                                             P_LINHA_X09.IDENT_CONTA,
                                             P_LINHA_X09.IDENT_OBSERVACAO,
                                             P_LINHA_X09.COD_TRIB_ISS,
                                             P_LINHA_X09.VLR_MAT_PROP,
                                             P_LINHA_X09.VLR_MAT_TERC,
                                             P_LINHA_X09.VLR_BASE_ISS_RETIDO,
                                             P_LINHA_X09.VLR_ISS_RETIDO,
                                             P_LINHA_X09.VLR_DEDUCAO_ISS,
                                             P_LINHA_X09.VLR_SUBEMPR_ISS,
                                             P_LINHA_X09.COD_CFPS,
                                             P_LINHA_X09.VLR_OUT_DESP,
                                             P_LINHA_X09.VLR_BASE_CIDE,
                                             P_LINHA_X09.VLR_ALIQ_CIDE,
                                             P_LINHA_X09.VLR_CIDE,
                                             P_LINHA_X09.VLR_COMISSAO,
                                             P_LINHA_X09.IND_VLR_PIS_COFINS,
                                             P_LINHA_X09.COD_SITUACAO_PIS,
                                             P_LINHA_X09.COD_SITUACAO_COFINS,
                                             P_LINHA_X09.VLR_PIS_EXP,
                                             P_LINHA_X09.VLR_PIS_TRIB,
                                             P_LINHA_X09.VLR_PIS_N_TRIB,
                                             P_LINHA_X09.VLR_COFINS_EXP,
                                             P_LINHA_X09.VLR_COFINS_TRIB,
                                             P_LINHA_X09.VLR_COFINS_N_TRIB,
                                             P_LINHA_X09.VLR_PIS_RETIDO,
                                             P_LINHA_X09.VLR_COFINS_RETIDO,
                                             P_LINHA_X09.DAT_LANC_PIS_COFINS,
                                             P_LINHA_X09.IND_PIS_COFINS_EXTEMP,
                                             P_LINHA_X09.IND_LOCAL_EXEC_SERV,
                                             P_LINHA_X09.IDENT_CUSTO,
                                             P_LINHA_X09.VLR_BASE_INSS,
                                             P_LINHA_X09.VLR_ALIQ_INSS,
                                             P_LINHA_X09.VLR_INSS_RETIDO,
                                             P_LINHA_X09.COD_NAT_REC,
                                             P_LINHA_X09.IND_NAT_BASE_CRED,
                                             P_LINHA_X09.VLR_ACRESCIMO,
                                             P_LINHA_X09.DSC_RESERVADO1,
                                             P_LINHA_X09.DSC_RESERVADO2,
                                             P_LINHA_X09.DSC_RESERVADO3,
                                             P_LINHA_X09.IDENT_NBS,
                                             P_LINHA_X09.VLR_TOT_ADIC,
                                             P_LINHA_X09.VLR_TOT_RET,
                                             P_LINHA_X09.VLR_DEDUCAO_NF,
                                             P_LINHA_X09.VLR_RET_NF,
                                             P_LINHA_X09.VLR_RET_SERV,
                                             P_LINHA_X09.VLR_ALIQ_ISS_RETIDO,
                                             P_LINHA_X09.COD_SIT_TRIB_ISS,
                                             P_LINHA_X09.VLR_N_RET_PRINC,
                                             P_LINHA_X09.VLR_N_RET_ADIC,
                                             P_LINHA_X09.VLR_DED_ALIM,
                                             P_LINHA_X09.VLR_DED_TRANS,
                                             P_LINHA_X09.IND_TP_PROC_ADJ_PRINC,
                                             P_LINHA_X09.IDENT_PROC_ADJ_PRINC,
                                             P_LINHA_X09.IDENT_SUSP_TBT_PRINC,
                                             P_LINHA_X09.IND_TP_PROC_ADJ_ADIC,
                                             P_LINHA_X09.IDENT_PROC_ADJ_ADIC,
                                             P_LINHA_X09.IDENT_SUSP_TBT_ADIC,
                                             P_LINHA_X09.VLR_SERV_15,
                                             P_LINHA_X09.VLR_SERV_20,
                                             P_LINHA_X09.VLR_SERV_25,
                                             P_LINHA_X09.VLR_ABAT_NTRIBUTADO,
                                             P_LINHA_X09.COD_ATIV_RJ,
                                             P_LINHA_X09.DSC_RESERVADO4,
                                             P_LINHA_X09.DSC_RESERVADO5,
                                             P_LINHA_X09.DSC_RESERVADO6,
                                             P_LINHA_X09.DSC_RESERVADO7,
                                             P_LINHA_X09.DSC_RESERVADO8);
                                         
     ELSE
       LIB_PROC.ADD_LOG('Erro ao gerar registro da SAFX09: Informe um registro ou um rowid para geração',1);
    END IF;
    
    
    IF TRIM(VS_LINHA) IS NOT NULL
      THEN
        
         --REALIZA O INSERT DA LINHA NA TABELA SAFX09
         V_ROWID_RETORNO := MSAF_EXPORTA_NOTA_CPROC.INSERT_LINE_SAFX09(VS_LINHA, P_PROCESSO);
         
    END IF;
    
    COMMIT;
    
    RETURN V_ROWID_RETORNO;
    
  END;


FUNCTION GERA_SAFX10(P_LINHA_X10  X10_ESTOQUE%ROWTYPE DEFAULT NULL
                        , P_BY_ROWID VARCHAR2 DEFAULT 'N'
                        , P_ROWID    ROWID    DEFAULT NULL
                        , P_PROCESSO NUMBER) RETURN ROWID IS
    
  VR_X10    X10_ESTOQUE%ROWTYPE;
  V_ROWID_RETORNO ROWID;
  

  BEGIN
    IF
      (P_BY_ROWID = 'S' AND P_ROWID IS NOT NULL) THEN -- RECUPERAR REGISTRO PELO ROWID
      
      BEGIN
        SELECT *
               INTO   VR_X10
               FROM   X10_ESTOQUE
        WHERE ROWID = P_ROWID;
        

         -- FORMATA REGISTRO PARA LINHA SAFX10
             VS_LINHA := MSAF_EXPORTA_NOTA_CPROC.X10(VR_X10.COD_EMPRESA,
                                                        VR_X10.COD_ESTAB,
                                                        VR_X10.MOVTO_E_S,
                                                        VR_X10.NORM_DEV,
                                                        VR_X10.GRUPO_CONTAGEM,
                                                        VR_X10.IDENT_DOCTO,
                                                        VR_X10.DATA_MOVTO,
                                                        VR_X10.NUM_DOCTO,
                                                        VR_X10.SERIE_DOCFIS,
                                                        VR_X10.SUB_SERIE_DOCFIS,
                                                        VR_X10.IDENT_PRODUTO,
                                                        VR_X10.DISCRI_ESTOQUE,
                                                        VR_X10.NUM_ITEM,
                                                        VR_X10.IDENT_UND_PADRAO,
                                                        VR_X10.IDENT_ALMOX,
                                                        VR_X10.IDENT_CUSTO,
                                                        VR_X10.IDENT_NAT_ESTOQUE,
                                                        VR_X10.CONTRATO,
                                                        VR_X10.SERIE_ITEM,
                                                        VR_X10.QTD_MOVTO,
                                                        VR_X10.PRECO_UNIT,
                                                        VR_X10.PRECO_ITEM,
                                                        VR_X10.CUSTO_UNIT,
                                                        VR_X10.CUSTO_ITEM,
                                                        VR_X10.IDENT_CONTA_CRED,
                                                        VR_X10.IDENT_CONTA_DEBITO,
                                                        VR_X10.IDENT_OPERACAO,
                                                        VR_X10.IDENT_CFO,
                                                        VR_X10.COD_ENT_SAIDA,
                                                        VR_X10.VLR_IPI,
                                                        VR_X10.DATA_ESCRITA_FIS,
                                                        VR_X10.OBS_ESTOQUE,
                                                        VR_X10.IDENT_MEDIDA,
                                                        VR_X10.IDENT_NBM,
                                                        VR_X10.NUM_PROCESSO,
                                                        VR_X10.IND_GRAVACAO,
                                                        VR_X10.IND_INSUMO,
                                                        VR_X10.IDENT_LEGENDA,
                                                        VR_X10.NUM_ORDEM,
                                                        VR_X10.NUM_DOCFIS_OFIC,
                                                        VR_X10.SERIE_DOCFIS_OFIC,
                                                        VR_X10.S_SERIE_DOCFIS_OFIC,
                                                        VR_X10.IDENT_FIS_JUR,
                                                        VR_X10.IND_TP_MOVTO,
                                                        VR_X10.INSC_ESTADUAL,
                                                        VR_X10.IDENT_PROD_RASTRO,
                                                        VR_X10.NUM_LIVRO,
                                                        VR_X10.NUM_FOLHA,
                                                        VR_X10.VLR_ICMS,
                                                        VR_X10.DATA_DISP,
                                                        VR_X10.IND_DOC_OPER,
                                                        VR_X10.IND_TP_DOC_INTERNO,
                                                        VR_X10.IND_REDESIGNACAO,
                                                        VR_X10.IDENT_PRODUTO_ORI,
                                                        VR_X10.VLR_CUSTO_DCA,
                                                        VR_X10.VLR_OUT_TRIB_NCUMUL,
                                                        VR_X10.COD_TP_LANCTO,
                                                        VR_X10.VLR_ICMS_DCA,
                                                        VR_X10.COD_DIF_PRODUCAO,
                                                        VR_X10.DSC_FINALIDADE,
                                                        VR_X10.COD_TIPO_MOV_EST,
                                                        VR_X10.IDENT_MEDIDA_ORI,
                                                        VR_X10.COD_NIVEL_PRODUTO,
                                                        VR_X10.QTD_INSUMO,
                                                        VR_X10.IND_CF);

        
        EXCEPTION
          WHEN OTHERS THEN
            LIB_PROC.ADD_LOG('Erro ao recuperar "rowid" da x10_estoque, registro não será gerado: '||P_ROWID,1);
      END;
      
      
    ELSIF (P_BY_ROWID = 'N' AND P_LINHA_X10.COD_EMPRESA IS NOT NULL) THEN -- GERA POR REGISTRO ROWTYPE
      
         -- FORMATA REGISTRO PARA LINHA SAFX10
             VS_LINHA := MSAF_EXPORTA_NOTA_CPROC.X10(P_LINHA_X10.COD_EMPRESA,
                                                      P_LINHA_X10.COD_ESTAB,
                                                      P_LINHA_X10.MOVTO_E_S,
                                                      P_LINHA_X10.NORM_DEV,
                                                      P_LINHA_X10.GRUPO_CONTAGEM,
                                                      P_LINHA_X10.IDENT_DOCTO,
                                                      P_LINHA_X10.DATA_MOVTO,
                                                      P_LINHA_X10.NUM_DOCTO,
                                                      P_LINHA_X10.SERIE_DOCFIS,
                                                      P_LINHA_X10.SUB_SERIE_DOCFIS,
                                                      P_LINHA_X10.IDENT_PRODUTO,
                                                      P_LINHA_X10.DISCRI_ESTOQUE,
                                                      P_LINHA_X10.NUM_ITEM,
                                                      P_LINHA_X10.IDENT_UND_PADRAO,
                                                      P_LINHA_X10.IDENT_ALMOX,
                                                      P_LINHA_X10.IDENT_CUSTO,
                                                      P_LINHA_X10.IDENT_NAT_ESTOQUE,
                                                      P_LINHA_X10.CONTRATO,
                                                      P_LINHA_X10.SERIE_ITEM,
                                                      P_LINHA_X10.QTD_MOVTO,
                                                      P_LINHA_X10.PRECO_UNIT,
                                                      P_LINHA_X10.PRECO_ITEM,
                                                      P_LINHA_X10.CUSTO_UNIT,
                                                      P_LINHA_X10.CUSTO_ITEM,
                                                      P_LINHA_X10.IDENT_CONTA_CRED,
                                                      P_LINHA_X10.IDENT_CONTA_DEBITO,
                                                      P_LINHA_X10.IDENT_OPERACAO,
                                                      P_LINHA_X10.IDENT_CFO,
                                                      P_LINHA_X10.COD_ENT_SAIDA,
                                                      P_LINHA_X10.VLR_IPI,
                                                      P_LINHA_X10.DATA_ESCRITA_FIS,
                                                      P_LINHA_X10.OBS_ESTOQUE,
                                                      P_LINHA_X10.IDENT_MEDIDA,
                                                      P_LINHA_X10.IDENT_NBM,
                                                      P_LINHA_X10.NUM_PROCESSO,
                                                      P_LINHA_X10.IND_GRAVACAO,
                                                      P_LINHA_X10.IND_INSUMO,
                                                      P_LINHA_X10.IDENT_LEGENDA,
                                                      P_LINHA_X10.NUM_ORDEM,
                                                      P_LINHA_X10.NUM_DOCFIS_OFIC,
                                                      P_LINHA_X10.SERIE_DOCFIS_OFIC,
                                                      P_LINHA_X10.S_SERIE_DOCFIS_OFIC,
                                                      P_LINHA_X10.IDENT_FIS_JUR,
                                                      P_LINHA_X10.IND_TP_MOVTO,
                                                      P_LINHA_X10.INSC_ESTADUAL,
                                                      P_LINHA_X10.IDENT_PROD_RASTRO,
                                                      P_LINHA_X10.NUM_LIVRO,
                                                      P_LINHA_X10.NUM_FOLHA,
                                                      P_LINHA_X10.VLR_ICMS,
                                                      P_LINHA_X10.DATA_DISP,
                                                      P_LINHA_X10.IND_DOC_OPER,
                                                      P_LINHA_X10.IND_TP_DOC_INTERNO,
                                                      P_LINHA_X10.IND_REDESIGNACAO,
                                                      P_LINHA_X10.IDENT_PRODUTO_ORI,
                                                      P_LINHA_X10.VLR_CUSTO_DCA,
                                                      P_LINHA_X10.VLR_OUT_TRIB_NCUMUL,
                                                      P_LINHA_X10.COD_TP_LANCTO,
                                                      P_LINHA_X10.VLR_ICMS_DCA,
                                                      P_LINHA_X10.COD_DIF_PRODUCAO,
                                                      P_LINHA_X10.DSC_FINALIDADE,
                                                      P_LINHA_X10.COD_TIPO_MOV_EST,
                                                      P_LINHA_X10.IDENT_MEDIDA_ORI,
                                                      P_LINHA_X10.COD_NIVEL_PRODUTO,
                                                      P_LINHA_X10.QTD_INSUMO,
                                                      P_LINHA_X10.IND_CF);
                                         
     ELSE
       LIB_PROC.ADD_LOG('Erro ao gerar registro da x10_estoque: Informe um registro ou um rowid para geração',1);
    END IF;
    
    
    IF TRIM(VS_LINHA) IS NOT NULL
      THEN
        
         --REALIZA O INSERT DA LINHA NA TABELA SAFX10
         V_ROWID_RETORNO := MSAF_EXPORTA_NOTA_CPROC.INSERT_LINE_SAFX10(VS_LINHA, P_PROCESSO);
         
    END IF;
    
    COMMIT;
    
    RETURN V_ROWID_RETORNO;
    
  END;


FUNCTION GERA_SAFX112(P_LINHA_X112  X112_OBS_DOCFIS%ROWTYPE DEFAULT NULL
                        , P_BY_ROWID VARCHAR2 DEFAULT 'N'
                        , P_ROWID    ROWID    DEFAULT NULL
                        , P_PROCESSO NUMBER
                        ) RETURN ROWID IS
    
  VR_X112    X112_OBS_DOCFIS%ROWTYPE;
  V_ROWID_RETORNO ROWID;

  BEGIN
    IF
      (P_BY_ROWID = 'S' AND P_ROWID IS NOT NULL) THEN -- RECUPERAR REGISTRO PELO ROWID
      
      BEGIN
        SELECT *
               INTO   VR_X112
               FROM X112_OBS_DOCFIS
        WHERE ROWID = P_ROWID;
        

         -- FORMATA REGISTRO PARA LINHA SAFX112
         VS_LINHA := MSAF_EXPORTA_NOTA_CPROC.X112(VR_X112.COD_EMPRESA,
                                                  VR_X112.COD_ESTAB,
                                                  VR_X112.DATA_FISCAL,
                                                  VR_X112.MOVTO_E_S,
                                                  VR_X112.NORM_DEV,
                                                  VR_X112.IDENT_DOCTO,
                                                  VR_X112.IDENT_FIS_JUR,
                                                  VR_X112.NUM_DOCFIS,
                                                  VR_X112.SERIE_DOCFIS,
                                                  VR_X112.SUB_SERIE_DOCFIS,
                                                  VR_X112.IDENT_OBSERVACAO,
                                                  VR_X112.IND_ICOMPL_LANCTO,
                                                  VR_X112.DSC_COMPLEMENTAR,
                                                  VR_X112.VINCULACAO);

        
        EXCEPTION
          WHEN OTHERS THEN
            LIB_PROC.ADD_LOG('Erro ao recuperar "rowid" da x112_obs_docfis, registro não será gerado: '||P_ROWID,1);
      END;
      
      
    ELSIF (P_BY_ROWID = 'N' AND P_LINHA_X112.COD_EMPRESA IS NOT NULL) THEN -- GERA POR REGISTRO ROWTYPE
      
         -- FORMATA REGISTRO PARA LINHA SAFX112
         VS_LINHA := MSAF_EXPORTA_NOTA_CPROC.X112(P_LINHA_X112.COD_EMPRESA,
                                                  P_LINHA_X112.COD_ESTAB,
                                                  P_LINHA_X112.DATA_FISCAL,
                                                  P_LINHA_X112.MOVTO_E_S,
                                                  P_LINHA_X112.NORM_DEV,
                                                  P_LINHA_X112.IDENT_DOCTO,
                                                  P_LINHA_X112.IDENT_FIS_JUR,
                                                  P_LINHA_X112.NUM_DOCFIS,
                                                  P_LINHA_X112.SERIE_DOCFIS,
                                                  P_LINHA_X112.SUB_SERIE_DOCFIS,
                                                  P_LINHA_X112.IDENT_OBSERVACAO,
                                                  P_LINHA_X112.IND_ICOMPL_LANCTO,
                                                  P_LINHA_X112.DSC_COMPLEMENTAR,
                                                  P_LINHA_X112.VINCULACAO);
                                         
     ELSE
       LIB_PROC.ADD_LOG('Erro ao gerar registro da x112_obs_docfis: Informe um registro ou um rowid para geração',1);
    END IF;
    
    
    IF TRIM(VS_LINHA) IS NOT NULL
      THEN
        
         --REALIZA O INSERT DA LINHA NA TABELA SAFX112
         V_ROWID_RETORNO := MSAF_EXPORTA_NOTA_CPROC.INSERT_LINE_SAFX112(VS_LINHA, P_PROCESSO);
         
    END IF;
    
    COMMIT;
    
    RETURN V_ROWID_RETORNO;
    
  END;
  
FUNCTION GERA_SAFX113(P_LINHA_X113  X113_AJUSTE_APUR%ROWTYPE DEFAULT NULL
                        , P_BY_ROWID VARCHAR2 DEFAULT 'N'
                        , P_ROWID    ROWID    DEFAULT NULL
                        , P_PROCESSO NUMBER
                        ) RETURN ROWID IS
    
  VR_X113    X113_AJUSTE_APUR%ROWTYPE;
  V_ROWID_RETORNO ROWID;

  BEGIN
    IF
      (P_BY_ROWID = 'S' AND P_ROWID IS NOT NULL) THEN -- RECUPERAR REGISTRO PELO ROWID
      
      BEGIN
        SELECT *
               INTO   VR_X113
               FROM X113_AJUSTE_APUR
        WHERE ROWID = P_ROWID;
        

         -- FORMATA REGISTRO PARA LINHA SAFX113
         VS_LINHA := MSAF_EXPORTA_NOTA_CPROC.X113(VR_X113.COD_EMPRESA,
                                                   VR_X113.COD_ESTAB,
                                                   VR_X113.DATA_FISCAL,
                                                   VR_X113.MOVTO_E_S,
                                                   VR_X113.NORM_DEV,
                                                   VR_X113.IDENT_DOCTO,
                                                   VR_X113.IDENT_FIS_JUR,
                                                   VR_X113.NUM_DOCFIS,
                                                   VR_X113.SERIE_DOCFIS,
                                                   VR_X113.SUB_SERIE_DOCFIS,
                                                   VR_X113.IDENT_OBSERVACAO,
                                                   --VR_X113.IND_ICOMPL_LANCTO,
                                                   VR_X113.COD_AJUSTE_SPED,
                                                   VR_X113.DISCRI_ITEM,
                                                   VR_X113.DSC_COMP_AJUSTE,
                                                   VR_X113.NUM_ITEM,
                                                   VR_X113.VLR_BASE_ICMS,
                                                   VR_X113.ALIQUOTA_ICMS,
                                                   VR_X113.VLR_ICMS,
                                                   VR_X113.VLR_OUTROS);

        
        EXCEPTION
          WHEN OTHERS THEN
            LIB_PROC.ADD_LOG('Erro ao recuperar "rowid" da x113_ajuste_apur, registro não será gerado: '||P_ROWID,1);
      END;
      
      
    ELSIF (P_BY_ROWID = 'N' AND P_LINHA_X113.COD_EMPRESA IS NOT NULL) THEN -- GERA POR REGISTRO ROWTYPE
      
         -- FORMATA REGISTRO PARA LINHA SAFX113
         VS_LINHA := MSAF_EXPORTA_NOTA_CPROC.X113(P_LINHA_X113.COD_EMPRESA,
                                                   P_LINHA_X113.COD_ESTAB,
                                                   P_LINHA_X113.DATA_FISCAL,
                                                   P_LINHA_X113.MOVTO_E_S,
                                                   P_LINHA_X113.NORM_DEV,
                                                   P_LINHA_X113.IDENT_DOCTO,
                                                   P_LINHA_X113.IDENT_FIS_JUR,
                                                   P_LINHA_X113.NUM_DOCFIS,
                                                   P_LINHA_X113.SERIE_DOCFIS,
                                                   P_LINHA_X113.SUB_SERIE_DOCFIS,
                                                   P_LINHA_X113.IDENT_OBSERVACAO,
                                                   --P_LINHA_X113.IND_ICOMPL_LANCTO,
                                                   P_LINHA_X113.COD_AJUSTE_SPED,
                                                   P_LINHA_X113.DISCRI_ITEM,
                                                   P_LINHA_X113.DSC_COMP_AJUSTE,
                                                   P_LINHA_X113.NUM_ITEM,
                                                   P_LINHA_X113.VLR_BASE_ICMS,
                                                   P_LINHA_X113.ALIQUOTA_ICMS,
                                                   P_LINHA_X113.VLR_ICMS,
                                                   P_LINHA_X113.VLR_OUTROS);
                                         
     ELSE
       LIB_PROC.ADD_LOG('Erro ao gerar registro da x113_ajuste_apur: Informe um registro ou um rowid para geração',1);
    END IF;
    
    
    IF TRIM(VS_LINHA) IS NOT NULL
      THEN
        
         --REALIZA O INSERT DA LINHA NA TABELA SAFX113
         V_ROWID_RETORNO := MSAF_EXPORTA_NOTA_CPROC.INSERT_LINE_SAFX113(VS_LINHA, P_PROCESSO);
         
    END IF;
    
    COMMIT;
    
    RETURN V_ROWID_RETORNO;
    
  END;

FUNCTION GERA_SAFX116(P_LINHA_X116  X116_DOCFIS_REF%ROWTYPE DEFAULT NULL
                        , P_BY_ROWID VARCHAR2 DEFAULT 'N'
                        , P_ROWID    ROWID    DEFAULT NULL
                        , P_PROCESSO NUMBER
                        ) RETURN ROWID IS
    
  VR_X116    X116_DOCFIS_REF%ROWTYPE;
  V_ROWID_RETORNO ROWID;

  BEGIN
    IF
      (P_BY_ROWID = 'S' AND P_ROWID IS NOT NULL) THEN -- RECUPERAR REGISTRO PELO ROWID
      
      BEGIN
        SELECT *
               INTO   VR_X116
               FROM   X116_DOCFIS_REF
        WHERE ROWID = P_ROWID;
        

         -- FORMATA REGISTRO PARA LINHA SAFX113
         VS_LINHA := MSAF_EXPORTA_NOTA_CPROC.X116(p_Cod_Empresa          => VR_X116.COD_EMPRESA,
                                                  p_Cod_Estab            => VR_X116.COD_ESTAB,
                                                  p_Data_Fiscal          => VR_X116.DATA_FISCAL,
                                                  p_Movto_e_s            => VR_X116.MOVTO_E_S,
                                                  p_Norm_Dev             => VR_X116.NORM_DEV,
                                                  p_Ident_Docto          => VR_X116.IDENT_DOCTO,
                                                  p_Ident_Fis_Jur        => VR_X116.IDENT_FIS_JUR,
                                                  p_Num_Docfis           => VR_X116.NUM_DOCFIS,
                                                  p_Serie_Docfis         => VR_X116.SERIE_DOCFIS,
                                                  p_Sub_Serie_Docfis     => VR_X116.SUB_SERIE_DOCFIS,
                                                  p_Ident_Observacao     => VR_X116.IDENT_OBSERVACAO,
                                                  p_Data_Fiscal_Ref      => VR_X116.DATA_FISCAL_REF,
                                                  p_Movto_e_s_Ref        => VR_X116.MOVTO_E_S_REF,
                                                  p_Ident_Fis_Jur_Ref    => VR_X116.IDENT_FIS_JUR_REF,
                                                  p_Num_Docfis_Ref       => VR_X116.NUM_DOCFIS_REF,
                                                  p_Serie_Docfis_Ref     => VR_X116.SERIE_DOCFIS_REF,
                                                  p_Sub_Serie_Docfis_Ref => VR_X116.SUB_SERIE_DOCFIS_REF,
                                                  p_Ident_Modelo_Ref     => VR_X116.IDENT_MODELO_REF,
                                                  p_num_autentic_nfe     => VR_X116.NUM_AUTENTIC_NFE);

        
        EXCEPTION
          WHEN OTHERS THEN
            LIB_PROC.ADD_LOG('Erro ao recuperar "rowid" da X116_DOCFIS_REF, registro não será gerado: '||P_ROWID,1);
      END;
      
      
    ELSIF (P_BY_ROWID = 'N' AND P_LINHA_X116.COD_EMPRESA IS NOT NULL) THEN -- GERA POR REGISTRO ROWTYPE
      
         -- FORMATA REGISTRO PARA LINHA SAFX116
         VS_LINHA := MSAF_EXPORTA_NOTA_CPROC.X116(P_LINHA_X116.COD_EMPRESA,
                                                  P_LINHA_X116.COD_ESTAB,         
                                                  P_LINHA_X116.DATA_FISCAL,
                                                  P_LINHA_X116.MOVTO_E_S,
                                                  P_LINHA_X116.NORM_DEV,
                                                  P_LINHA_X116.IDENT_DOCTO,
                                                  P_LINHA_X116.IDENT_FIS_JUR,
                                                  P_LINHA_X116.NUM_DOCFIS,
                                                  P_LINHA_X116.SERIE_DOCFIS,
                                                  P_LINHA_X116.SUB_SERIE_DOCFIS,
                                                  P_LINHA_X116.IDENT_OBSERVACAO,
                                                  P_LINHA_X116.DATA_FISCAL_REF,
                                                  P_LINHA_X116.MOVTO_E_S_REF,
                                                  P_LINHA_X116.IDENT_FIS_JUR_REF,
                                                  P_LINHA_X116.NUM_DOCFIS_REF,
                                                  P_LINHA_X116.SERIE_DOCFIS_REF,
                                                  P_LINHA_X116.SUB_SERIE_DOCFIS_REF,
                                                  P_LINHA_X116.IDENT_MODELO_REF,
                                                  P_LINHA_X116.NUM_AUTENTIC_NFE);


     ELSE
       LIB_PROC.ADD_LOG('Erro ao gerar registro da X116_DOCFIS_REF: Informe um registro ou um rowid para geração',1);
    END IF;
    
    
    IF TRIM(VS_LINHA) IS NOT NULL
      THEN
        
         --REALIZA O INSERT DA LINHA NA TABELA SAFX116
         V_ROWID_RETORNO := MSAF_EXPORTA_NOTA_CPROC.INSERT_LINE_SAFX116(VS_LINHA, P_PROCESSO);
         
    END IF;
    
    COMMIT;
    
    RETURN V_ROWID_RETORNO;
    
  END;


FUNCTION GERA_SAFX2013(P_LINHA_X2013  X2013_PRODUTO%ROWTYPE DEFAULT NULL
                        , P_BY_ROWID VARCHAR2 DEFAULT 'N'
                        , P_ROWID    ROWID    DEFAULT NULL
                        , P_PROCESSO NUMBER) RETURN ROWID IS
    
  VR_X2013    X2013_PRODUTO%ROWTYPE;
  V_ROWID_RETORNO ROWID;

  BEGIN
    IF
      (P_BY_ROWID = 'S' AND P_ROWID IS NOT NULL) THEN -- RECUPERAR REGISTRO PELO ROWID
      
      BEGIN
        SELECT *
               INTO   VR_X2013
               FROM X2013_PRODUTO
        WHERE ROWID = P_ROWID;
        

         -- FORMATA REGISTRO PARA LINHA SAFX2013
         VS_LINHA := MSAF_EXPORTA_NOTA_CPROC.X2013(VR_X2013.IDENT_PRODUTO,
                                                    VR_X2013.GRUPO_PRODUTO,
                                                    VR_X2013.IND_PRODUTO,
                                                    VR_X2013.COD_PRODUTO,
                                                    VR_X2013.VALID_PRODUTO,
                                                    VR_X2013.DESCRICAO,
                                                    VR_X2013.IDENT_NBM,
                                                    VR_X2013.IND_REGIDO_SUBST,
                                                    VR_X2013.IND_CONTROLE_SELO,
                                                    VR_X2013.NUM_PROCESSO,
                                                    VR_X2013.IND_GRAVACAO,
                                                    VR_X2013.IDENT_NCM,
                                                    VR_X2013.IDENT_NALADI,
                                                    VR_X2013.IDENT_MEDIDA,
                                                    VR_X2013.IDENT_GRUPO_PROD,
                                                    VR_X2013.IND_FUNRURAL,
                                                    VR_X2013.IND_PETR_ENERG,
                                                    VR_X2013.IND_PRD_INCENTIV,
                                                    VR_X2013.IND_ICMS_DIFERIDO,
                                                    VR_X2013.COD_GRP_INCENT,
                                                    VR_X2013.COD_GRUPO_ST,
                                                    VR_X2013.IDENT_CONTA,
                                                    VR_X2013.IND_INCID_ICMS_SER,
                                                    VR_X2013.IDENT_UND_PADRAO,
                                                    VR_X2013.VLR_PESO_UNIT_KG,
                                                    VR_X2013.DESCR_DETALHADA,
                                                    VR_X2013.IND_FABRIC_ESTAB,
                                                    VR_X2013.FATOR_CONVERSAO,
                                                    VR_X2013.IND_CLASSIF_ICMSS,
                                                    VR_X2013.DSC_MODELO,
                                                    VR_X2013.ORIGEM,
                                                    VR_X2013.IDENT_GRP_PROD,
                                                    VR_X2013.IND_INCID_PIS,
                                                    VR_X2013.ALIQ_PIS,
                                                    VR_X2013.IND_INCID_COFINS,
                                                    VR_X2013.ALIQ_COFINS,
                                                    VR_X2013.CAPAC_VOLUM,
                                                    VR_X2013.ESPECIE_DNF,
                                                    VR_X2013.CLAS_ITEM,
                                                    VR_X2013.COD_BARRAS,
                                                    VR_X2013.COD_ANP,
                                                    VR_X2013.IND_ANT_PROD,
                                                    VR_X2013.COD_ANT_ITEM,
                                                    VR_X2013.DAT_ALT_CODIGO,
                                                    VR_X2013.CLAS_ENQUAD_IPI,
                                                    VR_X2013.MATERIAL_RESULT_PERDA,
                                                    VR_X2013.DSC_FINALIDADE,
                                                    VR_X2013.QTD_CAP_MAX_ARMAZ,
                                                    VR_X2013.IND_ATIVO_SAICS,
                                                    VR_X2013.IND_TAB_INCIDENCIA,
                                                    VR_X2013.COD_GRUPO,
                                                    VR_X2013.MARCA_COMERCIAL,
                                                    VR_X2013.IND_CARAC_PRODUTO,
                                                    VR_X2013.COD_CEST,
                                                    VR_X2013.VLR_RESERVADO1,
                                                    VR_X2013.VLR_RESERVADO2,
                                                    VR_X2013.VLR_RESERVADO3,
                                                    VR_X2013.DSC_RESERVADO4,
                                                    VR_X2013.DSC_RESERVADO5,
                                                    VR_X2013.DSC_RESERVADO6,
                                                    VR_X2013.DSC_RESERVADO7,
                                                    VR_X2013.DSC_RESERVADO8,
                                                    VR_X2013.IND_INC_RICMS_PR);

        
        EXCEPTION
          WHEN OTHERS THEN
            LIB_PROC.ADD_LOG('Erro ao recuperar "rowid" da X2013_PRODUTO, registro não será gerado: '||P_ROWID,1);
      END;
      
      
    ELSIF (P_BY_ROWID = 'N' AND P_LINHA_X2013.IDENT_PRODUTO IS NOT NULL) THEN -- GERA POR REGISTRO ROWTYPE
      
         -- FORMATA REGISTRO PARA LINHA SAFX2013
         VS_LINHA := MSAF_EXPORTA_NOTA_CPROC.X2013(P_LINHA_X2013.IDENT_PRODUTO,
                                                  P_LINHA_X2013.GRUPO_PRODUTO,
                                                  P_LINHA_X2013.IND_PRODUTO,
                                                  P_LINHA_X2013.COD_PRODUTO,
                                                  P_LINHA_X2013.VALID_PRODUTO,
                                                  P_LINHA_X2013.DESCRICAO,
                                                  P_LINHA_X2013.IDENT_NBM,
                                                  P_LINHA_X2013.IND_REGIDO_SUBST,
                                                  P_LINHA_X2013.IND_CONTROLE_SELO,
                                                  P_LINHA_X2013.NUM_PROCESSO,
                                                  P_LINHA_X2013.IND_GRAVACAO,
                                                  P_LINHA_X2013.IDENT_NCM,
                                                  P_LINHA_X2013.IDENT_NALADI,
                                                  P_LINHA_X2013.IDENT_MEDIDA,
                                                  P_LINHA_X2013.IDENT_GRUPO_PROD,
                                                  P_LINHA_X2013.IND_FUNRURAL,
                                                  P_LINHA_X2013.IND_PETR_ENERG,
                                                  P_LINHA_X2013.IND_PRD_INCENTIV,
                                                  P_LINHA_X2013.IND_ICMS_DIFERIDO,
                                                  P_LINHA_X2013.COD_GRP_INCENT,
                                                  P_LINHA_X2013.COD_GRUPO_ST,
                                                  P_LINHA_X2013.IDENT_CONTA,
                                                  P_LINHA_X2013.IND_INCID_ICMS_SER,
                                                  P_LINHA_X2013.IDENT_UND_PADRAO,
                                                  P_LINHA_X2013.VLR_PESO_UNIT_KG,
                                                  P_LINHA_X2013.DESCR_DETALHADA,
                                                  P_LINHA_X2013.IND_FABRIC_ESTAB,
                                                  P_LINHA_X2013.FATOR_CONVERSAO,
                                                  P_LINHA_X2013.IND_CLASSIF_ICMSS,
                                                  P_LINHA_X2013.DSC_MODELO,
                                                  P_LINHA_X2013.ORIGEM,
                                                  P_LINHA_X2013.IDENT_GRP_PROD,
                                                  P_LINHA_X2013.IND_INCID_PIS,
                                                  P_LINHA_X2013.ALIQ_PIS,
                                                  P_LINHA_X2013.IND_INCID_COFINS,
                                                  P_LINHA_X2013.ALIQ_COFINS,
                                                  P_LINHA_X2013.CAPAC_VOLUM,
                                                  P_LINHA_X2013.ESPECIE_DNF,
                                                  P_LINHA_X2013.CLAS_ITEM,
                                                  P_LINHA_X2013.COD_BARRAS,
                                                  P_LINHA_X2013.COD_ANP,
                                                  P_LINHA_X2013.IND_ANT_PROD,
                                                  P_LINHA_X2013.COD_ANT_ITEM,
                                                  P_LINHA_X2013.DAT_ALT_CODIGO,
                                                  P_LINHA_X2013.CLAS_ENQUAD_IPI,
                                                  P_LINHA_X2013.MATERIAL_RESULT_PERDA,
                                                  P_LINHA_X2013.DSC_FINALIDADE,
                                                  P_LINHA_X2013.QTD_CAP_MAX_ARMAZ,
                                                  P_LINHA_X2013.IND_ATIVO_SAICS,
                                                  P_LINHA_X2013.IND_TAB_INCIDENCIA,
                                                  P_LINHA_X2013.COD_GRUPO,
                                                  P_LINHA_X2013.MARCA_COMERCIAL,
                                                  P_LINHA_X2013.IND_CARAC_PRODUTO,
                                                  P_LINHA_X2013.COD_CEST,
                                                  P_LINHA_X2013.VLR_RESERVADO1,
                                                  P_LINHA_X2013.VLR_RESERVADO2,
                                                  P_LINHA_X2013.VLR_RESERVADO3,
                                                  P_LINHA_X2013.DSC_RESERVADO4,
                                                  P_LINHA_X2013.DSC_RESERVADO5,
                                                  P_LINHA_X2013.DSC_RESERVADO6,
                                                  P_LINHA_X2013.DSC_RESERVADO7,
                                                  P_LINHA_X2013.DSC_RESERVADO8,
                                                  P_LINHA_X2013.IND_INC_RICMS_PR);
                                         
     ELSE
       LIB_PROC.ADD_LOG('Erro ao gerar registro da SAFX2013: Informe um registro ou um rowid para geração',1);
    END IF;
    
    
    IF TRIM(VS_LINHA) IS NOT NULL
      THEN
        
         --REALIZA O INSERT DA LINHA NA TABELA SAFX2013
         V_ROWID_RETORNO := MSAF_EXPORTA_NOTA_CPROC.INSERT_LINE_SAFX2013(VS_LINHA, P_PROCESSO);
         
    END IF;
    
    COMMIT;
    
    RETURN V_ROWID_RETORNO;
    
  END;
  
  PROCEDURE P_LIMPA_SAFX(P_SAFX      VARCHAR2
                        , P_PROCESSO NUMBER
                        , P_DATA_INI DATE DEFAULT NULL
                        , P_DATA_FIM DATE DEFAULT NULL
                        , P_IND_UTIL_DATA VARCHAR2 DEFAULT 'N'
                        , P_COL_FIL_DATA  VARCHAR2 DEFAULT NULL) IS
                         
  cur_safx SYS_REFCURSOR;
  TYPE tp_rowid IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
  tb_rowid tp_rowid;
  vn_bulk_limit CONSTANT INTEGER := '1000';
  vsql          VARCHAR2(2500);
  exInvalidUtilData    EXCEPTION;  
                         
  BEGIN
    
  --OPEN cur_safx FOR 'select rowid from '||P_SAFX||' where pst_id = '||P_PROCESSO;
  
      IF P_IND_UTIL_DATA = 'N' THEN

       vsql := 'select rowid from '||P_SAFX||' where 1=1 and pst_id = '||P_PROCESSO;

      ELSIF P_IND_UTIL_DATA = 'S' AND NVL(P_COL_FIL_DATA,' ') = ' ' THEN
       RAISE exInvalidUtilData;
             
      ELSIF P_IND_UTIL_DATA = 'S' AND P_COL_FIL_DATA IS NOT NULL THEN

      vsql := 'select rowid from '||P_SAFX||' where 1=1 '||
              ' AND '||P_COL_FIL_DATA||' >= '||''''||TO_CHAR(TO_DATE(P_DATA_INI),'YYYYMMDD')||''''||
              ' AND '||P_COL_FIL_DATA||' <= '||''''||TO_CHAR(TO_DATE(P_DATA_FIM),'YYYYMMDD')||''''||
              ' and pst_id = '||P_PROCESSO;

      ELSE
       RAISE exInvalidUtilData;
      
      END IF;
  
  OPEN cur_safx FOR vsql;
  LOOP
    
  FETCH cur_safx BULK COLLECT INTO tb_rowid LIMIT vn_bulk_limit;
  
  FOR del IN 1..tb_rowid.count
    LOOP
      EXECUTE IMMEDIATE 'delete from '||P_SAFX||' where rowid = '|| ''''||tb_rowid(del) ||'''';
    END LOOP;
    
    COMMIT;
    
  EXIT WHEN cur_safx%NOTFOUND;
  END LOOP;
  
  COMMIT;
  
  CLOSE cur_safx;
    
  --EXECUTE IMMEDIATE 'DELETE FROM '||P_SAFX||' WHERE PST_ID = '||P_PROCESSO;
  --COMMIT;
    
   EXCEPTION
     WHEN exInvalidUtilData THEN
       LIB_PROC.ADD_LOG('',1);
       LIB_PROC.ADD_LOG('Parâmetros incorretos para chamada da procedure P_LIMPA_SAFX'||SQLERRM||' - '||dbms_utility.format_error_backtrace,1);

     WHEN OTHERS THEN
       LIB_PROC.ADD_LOG('',1);
       LIB_PROC.ADD_LOG('Erro inesperado ao limpar SAFX, motivo: '||SQLERRM||' - '||dbms_utility.format_error_backtrace,1);
       LIB_PROC.ADD_LOG('Encaminhe ao time de suporte responsável pelo Taxone.',1);
  END;


  PROCEDURE P_GERA_DYN_TXT(P_SAFX             VARCHAR2
                           , P_PROCESSO       NUMBER
                           , P_USUARIO        VARCHAR2
                           , P_EMPRESA        VARCHAR2
                           , P_ESTAB          VARCHAR2
                           , P_DATA_INI       DATE
                           , P_DATA_FIM       DATE
                           , P_QTD_ARQ        NUMBER DEFAULT 1
                           , P_IND_UTIL_DATA  VARCHAR2 DEFAULT 'N'
                           , P_COL_FIL_DATA   VARCHAR2 DEFAULT NULL) IS
                       
  VRC_SAFX             SYS_REFCURSOR;
  VN_ID_CURSOR         NUMBER;
  VA_TAB_DESC          DBMS_SQL.desc_tab;
  VN_COL_COUNT         NUMBER;
  --VN_MAX_COLS          NUMBER;
  VS_COL_TYPE          VARCHAR2(1000);
  VN_COL_TYPE          NUMBER;
  VD_COL_TYPE          DATE;
  VCH_COL_TYPE         CHAR(1);
  VC_SQL               CLOB;
  VL_SQL1              LONG;
  VL_SQL2              LONG;
                       
  VS_DIRETORIO         VARCHAR2(250);
  VS_NOME_ARQUIVO      VARCHAR2(150);
  W_ARQ                UTL_FILE.file_type;

  exInvalidUtilData    EXCEPTION;

  BEGIN
    -- temporario para teste
    --VS_DIRETORIO    := 'MSAF';
    
    -- recupera diretorio
    BEGIN
      SELECT DIRECTORY_NAME 
             INTO VS_DIRETORIO
             FROM PRT_DIRETORIOS_SERVIDOR 
             WHERE COD_MODULO = 'JOB SERVIDOR'
             AND   ROWNUM = 1;
    END;
    
    VS_NOME_ARQUIVO := P_SAFX||'_'||P_PROCESSO||'__'||P_USUARIO||'.txt';
    -- adiciona extensao temporaria para evitar captura pela integracao camel
    VS_NOME_ARQUIVO := VS_NOME_ARQUIVO||'.taxonetmp';
    
    -- PREPARAR SQL DINAMICAMENTE, ORDENANDO CAMPOS DA SAFX
/*
    BEGIN
      SELECT 'SELECT '|| RTRIM(XMLAGG(XMLELEMENT(E, NOME_CAMPO, ', ').EXTRACT('//text()') ORDER BY NUM_CAMPO).GETCLOBVAL(),
                                ', ') || ' FROM '||P_SAFX||' WHERE PST_ID = '||P_PROCESSO X INTO VC_SQL
        FROM CAT_LAYOUT_IMP
       WHERE 1=1--ROWNUM <= 500
         AND NOM_TAB_WORK = P_SAFX
       ORDER BY NUM_CAMPO;
       
    -- CONVERTE CLOB PARA LONG
      VL_SQL1 := DBMS_LOB.SUBSTR(VC_SQL, 8000, 1);
      VL_SQL2 := DBMS_LOB.SUBSTR(VC_SQL, 8000, 8001);
    END;
*/

    BEGIN
      IF P_IND_UTIL_DATA = 'N' THEN
        
        SELECT 'SELECT '|| RTRIM(XMLAGG(XMLELEMENT(E, NOME_CAMPO, ', ').EXTRACT('//text()') ORDER BY NUM_CAMPO).GETCLOBVAL(),
                                  ', ') || ' FROM '||P_SAFX||' WHERE PST_ID = '||P_PROCESSO X INTO VC_SQL
          FROM CAT_LAYOUT_IMP
         WHERE 1=1--ROWNUM <= 500
           AND NOM_TAB_WORK = P_SAFX
         ORDER BY NUM_CAMPO;

      ELSIF P_IND_UTIL_DATA = 'S' AND NVL(P_COL_FIL_DATA,' ') = ' ' THEN
       RAISE exInvalidUtilData;
             
      ELSIF P_IND_UTIL_DATA = 'S' AND P_COL_FIL_DATA IS NOT NULL THEN
        
        SELECT 'SELECT ' || RTRIM(XMLAGG(XMLELEMENT(E, NOME_CAMPO, ', ').EXTRACT('//text()') ORDER BY NUM_CAMPO).GETCLOBVAL(),
                                  ', ') || ' FROM ' || P_SAFX ||
               ' WHERE 1=1 '||
               ' AND '||P_COL_FIL_DATA||' >= '||''''||TO_CHAR(TO_DATE(P_DATA_INI),'YYYYMMDD')||''''||
               ' AND '||P_COL_FIL_DATA||' <= '||''''||TO_CHAR(TO_DATE(P_DATA_FIM),'YYYYMMDD')||''''||
               'AND PST_ID = ' || P_PROCESSO X
          INTO VC_SQL
          FROM CAT_LAYOUT_IMP
         WHERE 1 = 1 --ROWNUM <= 500
           AND NOM_TAB_WORK = P_SAFX
         ORDER BY NUM_CAMPO;

      ELSE
       RAISE exInvalidUtilData;
      
      END IF;
    END;

      -- CONVERTE CLOB PARA LONG
        VL_SQL1 := DBMS_LOB.SUBSTR(VC_SQL, 8000, 1);
        VL_SQL2 := DBMS_LOB.SUBSTR(VC_SQL, 8000, 8001);


    -- PREPARA REF CURSOR
    BEGIN
     OPEN VRC_SAFX FOR VL_SQL1||VL_SQL2;
     
     -- OBTEM ID DO DYN CURSOR
     VN_ID_CURSOR := DBMS_SQL.to_cursor_number(VRC_SAFX);
     
     -- OBTEM DESCRICAO DAS COLUNAS DO DYN CURSOR NO ARRAY VA_TAB_DESC
     DBMS_SQL.describe_columns(c       => VN_ID_CURSOR,
                               col_cnt => VN_COL_COUNT,
                               desc_t  => VA_TAB_DESC);
                               
     --VN_MAX_COLS := VN_COL_COUNT;
                               
     -- DEFINE DATATYPE DAS COLUNAS
     FOR COL IN 1..VN_COL_COUNT
       LOOP

        IF VA_TAB_DESC(COL).col_type = 1 THEN -- VARCHAR
            DBMS_SQL.DEFINE_COLUMN(VN_ID_CURSOR, COL, VS_COL_TYPE, 1000);
            
        ELSIF VA_TAB_DESC(COL).col_type = 2 THEN -- NUMBER
            DBMS_SQL.DEFINE_COLUMN(VN_ID_CURSOR, COL, VN_COL_TYPE);
            
        ELSIF VA_TAB_DESC(COL).col_type = 12 THEN -- DATE
            DBMS_SQL.DEFINE_COLUMN(VN_ID_CURSOR, COL, VD_COL_TYPE);
            
        ELSIF VA_TAB_DESC(COL).col_type = 96 THEN -- CHAR
            DBMS_SQL.DEFINE_COLUMN(VN_ID_CURSOR, COL, VCH_COL_TYPE,1);

        END IF;
        
       END LOOP;
    END;
    
    BEGIN
      W_ARQ         := UTL_FILE.fopen(location     => VS_DIRETORIO,
                                      filename     => VS_NOME_ARQUIVO,
                                      open_mode    => 'W',
                                      max_linesize => '32760');
                                      
      -- CRIA CABECALHO PARA IMPORTACAO AUTOMATICA DO TXT
      BEGIN
       UTL_FILE.put_line(W_ARQ,'PARAM:'||P_EMPRESA||'_'||P_ESTAB||'_'||TO_CHAR(P_DATA_INI,'YYYYMMDD')||'_'||TO_CHAR(P_DATA_FIM,'YYYYMMDD')||'_'||P_PROCESSO||'CPROC'||'_'||P_QTD_ARQ);
      END;
                                      
      -- LOOP PARA CADA LINHA DO REF CURSOR
      WHILE DBMS_SQL.fetch_rows(VN_ID_CURSOR) > 0
        LOOP
          -- PARA CADA COLUNA DA LINHA DO CURSOR, FAZ O PUT DO CAMPO NO UTL_FILE
          
          FOR CL IN 1..VN_COL_COUNT
            LOOP
              
              IF CL = VN_COL_COUNT THEN -- SE FOR A ULTIMA COLUNA DO CURSOR, NAO ADICIONA O TAB
                
                 IF (VA_TAB_DESC(CL).col_type = 1) THEN
                    DBMS_SQL.COLUMN_VALUE(VN_ID_CURSOR, CL, VS_COL_TYPE);
                    UTL_FILE.PUT(W_ARQ, F_TRATA_CAMPO(VA_TAB_DESC(CL).col_name, VS_COL_TYPE) );
                    
                 ELSIF (VA_TAB_DESC(CL).col_type = 2) THEN
                    DBMS_SQL.COLUMN_VALUE(VN_ID_CURSOR, CL, VN_COL_TYPE);
                    UTL_FILE.PUT(W_ARQ, VN_COL_TYPE );
                    
                 ELSIF (VA_TAB_DESC(CL).col_type = 12) THEN
                    DBMS_SQL.COLUMN_VALUE(VN_ID_CURSOR, CL, VD_COL_TYPE);
                    UTL_FILE.PUT(W_ARQ, VD_COL_TYPE );
                    
                 ELSIF (VA_TAB_DESC(CL).col_type = 96) THEN
                    DBMS_SQL.COLUMN_VALUE(VN_ID_CURSOR, CL, VCH_COL_TYPE);
                    UTL_FILE.PUT(W_ARQ, VCH_COL_TYPE );
                    
                 END IF;
                
              ELSE
                
                 IF (VA_TAB_DESC(CL).col_type = 1) THEN
                    DBMS_SQL.COLUMN_VALUE(VN_ID_CURSOR, CL, VS_COL_TYPE);
                    UTL_FILE.PUT(W_ARQ, F_TRATA_CAMPO(VA_TAB_DESC(CL).col_name, VS_COL_TYPE)|| CHR(9));
                    
                 ELSIF (VA_TAB_DESC(CL).col_type = 2) THEN
                    DBMS_SQL.COLUMN_VALUE(VN_ID_CURSOR, CL, VN_COL_TYPE);
                    UTL_FILE.PUT(W_ARQ, VN_COL_TYPE|| CHR(9));
                    
                 ELSIF (VA_TAB_DESC(CL).col_type = 12) THEN
                    DBMS_SQL.COLUMN_VALUE(VN_ID_CURSOR, CL, VD_COL_TYPE);
                    UTL_FILE.PUT(W_ARQ, VD_COL_TYPE|| CHR(9));
                    
                 ELSIF (VA_TAB_DESC(CL).col_type = 96) THEN
                    DBMS_SQL.COLUMN_VALUE(VN_ID_CURSOR, CL, VCH_COL_TYPE);
                    UTL_FILE.PUT(W_ARQ, VCH_COL_TYPE|| CHR(9));
                    
                 END IF;
                 
              END IF;
            
            END LOOP;
            
            UTL_FILE.new_line(file => W_ARQ, lines => 1);
            
        END LOOP;
        
        DBMS_SQL.close_cursor(VN_ID_CURSOR);
        
        -- FINALIZA ARQUIVO
        BEGIN
          UTL_FILE.FFLUSH(file => W_ARQ);
          UTL_FILE.FCLOSE(W_ARQ);
          UTL_FILE.FRENAME(src_location  => VS_DIRETORIO,
                           src_filename  => VS_NOME_ARQUIVO,
                           dest_location => VS_DIRETORIO,
                           dest_filename => REPLACE(VS_NOME_ARQUIVO,'.taxonetmp',''),
                           overwrite     => TRUE);
        END;
      
      EXCEPTION
        WHEN UTL_FILE.INVALID_OPERATION THEN
          lib_proc.add_log('',1);
          lib_proc.add_log('Erro ao gerar arquivo txt, operação inválida. '||SQLERRM||' - '||dbms_utility.format_error_backtrace,1);
          lib_proc.add_log('',1);
          UTL_File.Fclose(W_ARQ);
        WHEN UTL_FILE.WRITE_ERROR THEN
          lib_proc.add_log('',1);
          lib_proc.add_log('Erro de gravação do arquivo txt. '||SQLERRM||' - '||dbms_utility.format_error_backtrace,1);
          lib_proc.add_log('',1);
          UTL_File.Fclose(W_ARQ);
        WHEN UTL_FILE.INVALID_PATH THEN
          lib_proc.add_log('',1);
          lib_proc.add_log('Diretório para gravação do arquivo txt inválido. '||SQLERRM||' - '||dbms_utility.format_error_backtrace,1);
          lib_proc.add_log('',1);
          UTL_File.Fclose(W_ARQ);
        WHEN UTL_FILE.INVALID_MODE THEN
          lib_proc.add_log('',1);
          lib_proc.add_log('Não foi possível acessar o arquivo ou diretório para gravação, entre em contato com o administrador. '||SQLERRM||' - '||dbms_utility.format_error_backtrace,1);
          lib_proc.add_log('',1);
          UTL_File.Fclose(W_ARQ);
        WHEN Others THEN
          lib_proc.add_log('',1);
          lib_proc.add_log('Erro inesperado ao gerar arquivo, motivo: '||SQLERRM||' - '||dbms_utility.format_error_backtrace,1);
          lib_proc.add_log('',1);
          UTL_File.Fclose(W_ARQ);
    END;
    
    
    -- termino da execucao
    P_LIMPA_SAFX(P_SAFX          => P_SAFX,
                 P_PROCESSO      => P_PROCESSO,
                 P_DATA_INI      => P_DATA_INI,
                 P_DATA_FIM      => P_DATA_FIM,
                 P_IND_UTIL_DATA => P_IND_UTIL_DATA,
                 P_COL_FIL_DATA  => P_COL_FIL_DATA
                 );
    
    -- log de geração
    LIB_PROC.ADD_LOG('',1);
    LIB_PROC.ADD_LOG('Geração do arquivo '|| REPLACE(VS_NOME_ARQUIVO,'.taxonetmp','') ||' finalizada.',1);
    LIB_PROC.ADD_LOG('Aguarde a rotina SFTP realizar a transferência e importação dos dados nos próximos minutos',1);
    
   EXCEPTION
     WHEN exInvalidUtilData THEN

    P_LIMPA_SAFX(P_SAFX          => P_SAFX,
                 P_PROCESSO      => P_PROCESSO,
                 P_DATA_INI      => P_DATA_INI,
                 P_DATA_FIM      => P_DATA_FIM,
                 P_IND_UTIL_DATA => P_IND_UTIL_DATA,
                 P_COL_FIL_DATA  => P_COL_FIL_DATA
                 );
    
       LIB_PROC.ADD_LOG('',1);
       LIB_PROC.ADD_LOG('Parâmetros incorretos para chamada da procedure P_GERA_DYN_TXT'||SQLERRM||' - '||dbms_utility.format_error_backtrace,1);
              
     WHEN OTHERS THEN
    P_LIMPA_SAFX(P_SAFX          => P_SAFX,
                 P_PROCESSO      => P_PROCESSO,
                 P_DATA_INI      => P_DATA_INI,
                 P_DATA_FIM      => P_DATA_FIM,
                 P_IND_UTIL_DATA => P_IND_UTIL_DATA,
                 P_COL_FIL_DATA  => P_COL_FIL_DATA
                 );
    
       LIB_PROC.ADD_LOG('',1);
       LIB_PROC.ADD_LOG('Erro inesperado ao gerar arquivo txt, motivo: '||SQLERRM||' - '||dbms_utility.format_error_backtrace,1);
       LIB_PROC.ADD_LOG('Encaminhe ao time de suporte responsável pelo Taxone.',1);
       
        -- FINALIZA ARQUIVO
        BEGIN
          UTL_FILE.FFLUSH(file => W_ARQ);
          UTL_FILE.FCLOSE(W_ARQ);
          UTL_FILE.fremove(location => VS_DIRETORIO, filename => VS_NOME_ARQUIVO);
         EXCEPTION
           WHEN OTHERS THEN
             NULL;
        END;
  END;
                       
                       
  /*PROCEDURE IMPORTA_SAFX (PCOD_EMPRESA VARCHAR2
                          , PCOD_ESTAB   VARCHAR2
                          , PDATA_INI    DATE
                          , PDATA_FIM    DATE
                          , PUSUARIO     VARCHAR2
                          , PTABELA      VARCHAR2)
                          
                          IS

  VN_CONT_SAFX INTEGER := 0;
  VN_PROC_SAFX INTEGER := 0;
  VN_STATUS_SAFX INTEGER := 0;

  BEGIN
  
  -- INICIO SAFX07
  BEGIN
    
    SELECT COUNT(*)
    INTO   VN_CONT_SAFX
    FROM   SAFX07 A
    WHERE  A.COD_EMPRESA = PCOD_EMPRESA
    AND    A.COD_ESTAB   = DECODE(PCOD_ESTAB,'TODOS',COD_ESTAB,PCOD_ESTAB)
    AND    TO_DATE(A.DATA_SAIDA_REC,'YYYYMMDD') BETWEEN PDATA_INI AND PDATA_FIM;
    
    
    IF VN_CONT_SAFX > 0 AND UPPER(PTABELA) = 'SAFX07'
      THEN
        
      SAF_INI_PROCESSO(P_NOME_PROC => 'IMPX07',
                       P_CD_EMPR   => PCOD_EMPRESA,
                       P_CD_ESTAB  => CASE WHEN PCOD_ESTAB = 'TODOS' THEN NULL ELSE PCOD_ESTAB END,
                       P_DT_INIC   => PDATA_INI,
                       P_DT_FIM    => PDATA_FIM,
                       P_USUARIO   => PUSUARIO,
                       P_NUM_PROC  => VN_PROC_SAFX);
                       
      
      SAF_IMP_X07(P_CD_EMPR         => PCOD_EMPRESA,
                  P_CD_ESTAB        => CASE WHEN PCOD_ESTAB = 'TODOS' THEN NULL ELSE PCOD_ESTAB END,
                  P_DT_INIC         => PDATA_INI,
                  P_DT_FIM          => PDATA_FIM,
                  P_PERC_ERRO       => 100,
                  P_USUARIO         => PUSUARIO,
                  P_IND_DROP_TAB    => 'S',
                  P_IND_SP_REGISTRO => 'S',
                  P_IND_LIM_PERIODO => 'S',
                  P_NR_PROC         => VN_PROC_SAFX,
                  P_IND_ATO_COTEPE  => 'N',
                  P_STATUS          => VN_STATUS_SAFX,
                  P_NUM_LOTE        => NULL);
                     

          LIB_PROC.ADD_LOG('',1);
          LIB_PROC.ADD_LOG('SAFX07 IMPORTADA, VERIFIQUE O LOG DE PROCESSO DE IMPORTAÇÃO NÚMERO '||VN_PROC_SAFX||' EM BASICOS > JOB SERVIDOR > CONTROLES > RELATÓRIO > RELATÓRIO POR PROCESSO > IMPORTAÇÃO PARA MAIORES DETALHES',1);
      
    END IF;
    
    
  END;
  -- FIM SAFX07
  
  -- INICIO SAFX08
  BEGIN
    
    SELECT COUNT(*)
    INTO   VN_CONT_SAFX
    FROM   SAFX08 A
    WHERE  A.COD_EMPRESA = PCOD_EMPRESA
    AND    A.COD_ESTAB   = DECODE(PCOD_ESTAB,'TODOS',COD_ESTAB,PCOD_ESTAB)
    AND    TO_DATE(A.DATA_FISCAL,'YYYYMMDD') BETWEEN PDATA_INI AND PDATA_FIM;
    
    
    IF VN_CONT_SAFX > 0 AND UPPER(PTABELA) = 'SAFX08'
      THEN
        
      SAF_INI_PROCESSO(P_NOME_PROC => 'IMPX08',
                       P_CD_EMPR   => PCOD_EMPRESA,
                       P_CD_ESTAB  => CASE WHEN PCOD_ESTAB = 'TODOS' THEN NULL ELSE PCOD_ESTAB END,
                       P_DT_INIC   => PDATA_INI,
                       P_DT_FIM    => PDATA_FIM,
                       P_USUARIO   => PUSUARIO,
                       P_NUM_PROC  => VN_PROC_SAFX);
                       
      
      SAF_IMP_X08(P_CD_EMPR         => PCOD_EMPRESA,
                  P_CD_ESTAB        => CASE WHEN PCOD_ESTAB = 'TODOS' THEN NULL ELSE PCOD_ESTAB END,
                  P_DT_INIC         => PDATA_INI,
                  P_DT_FIM          => PDATA_FIM,
                  P_PERC_ERRO       => 100,
                  P_USUARIO         => PUSUARIO,
                  P_IND_DROP_TAB    => 'S',
                  P_IND_SP_REGISTRO => 'S',
                  P_IND_LIM_PERIODO => 'S',
                  P_NR_PROC         => VN_PROC_SAFX,
                  P_IND_ATO_COTEPE  => 'N',
                  P_STATUS          => VN_STATUS_SAFX,
                  P_NUM_LOTE        => NULL);
                     

          LIB_PROC.ADD_LOG('',1);
          LIB_PROC.ADD_LOG('SAFX08 IMPORTADA, VERIFIQUE O LOG DE PROCESSO DE IMPORTAÇÃO NÚMERO '||VN_PROC_SAFX||' EM BASICOS > JOB SERVIDOR > CONTROLES > RELATÓRIO > RELATÓRIO POR PROCESSO > IMPORTAÇÃO PARA MAIORES DETALHES',1);
      
    END IF;
    
    
  END;
  -- FIM SAFX08
  
  -- INICIO SAFX09
  BEGIN
    
    SELECT COUNT(*)
    INTO   VN_CONT_SAFX
    FROM   SAFX09 A
    WHERE  A.COD_EMPRESA = PCOD_EMPRESA
    AND    A.COD_ESTAB   = DECODE(PCOD_ESTAB,'TODOS',COD_ESTAB,PCOD_ESTAB)
    AND    TO_DATE(A.DATA_FISCAL,'YYYYMMDD') BETWEEN PDATA_INI AND PDATA_FIM;
    
    
    IF VN_CONT_SAFX > 0 AND UPPER(PTABELA) = 'SAFX09'
      THEN
        
      SAF_INI_PROCESSO(P_NOME_PROC => 'IMPX09',
                       P_CD_EMPR   => PCOD_EMPRESA,
                       P_CD_ESTAB  => CASE WHEN PCOD_ESTAB = 'TODOS' THEN NULL ELSE PCOD_ESTAB END,
                       P_DT_INIC   => PDATA_INI,
                       P_DT_FIM    => PDATA_FIM,
                       P_USUARIO   => PUSUARIO,
                       P_NUM_PROC  => VN_PROC_SAFX);
                       
      SAF_IMP_X09_TD(P_CD_EMPR         => PCOD_EMPRESA,
                     P_CD_ESTAB        => CASE WHEN PCOD_ESTAB = 'TODOS' THEN NULL ELSE PCOD_ESTAB END,
                     P_DT_INIC         => PDATA_INI,
                     P_DT_FIM          => PDATA_FIM,
                     P_PERC_ERRO       => 100,
                     P_USUARIO         => PUSUARIO,
                     P_IND_DROP_TAB    => 'S',
                     P_IND_SP_REGISTRO => 'S',
                     P_NR_PROC         => VN_PROC_SAFX,
                     P_IND_ATO_COTEPE  => 'N',
                     P_STATUS          => VN_STATUS_SAFX,
                     P_NUM_LOTE        => NULL);
                       
                     

          LIB_PROC.ADD_LOG('',1);
          LIB_PROC.ADD_LOG('SAFX09 IMPORTADA, VERIFIQUE O LOG DE PROCESSO DE IMPORTAÇÃO NÚMERO  '||VN_PROC_SAFX||' EM BASICOS > JOB SERVIDOR > CONTROLES > RELATÓRIO > RELATÓRIO POR PROCESSO > IMPORTAÇÃO PARA MAIORES DETALHES',1);
      
    END IF;
    
    
  END;
  -- FIM SAFX09

  -- INICIO SAFX10
  BEGIN
    
    SELECT COUNT(*)
    INTO   VN_CONT_SAFX
    FROM   SAFX10 A
    WHERE  1=1
    AND    TO_DATE(A.DATA_MOVTO ,'YYYYMMDD') BETWEEN PDATA_INI AND PDATA_FIM;
    
    
    IF VN_CONT_SAFX > 0 AND UPPER(PTABELA) = 'SAFX10'
      THEN
        
      SAF_INI_PROCESSO(P_NOME_PROC => 'IMPX10',
                       P_CD_EMPR   => PCOD_EMPRESA,
                       P_CD_ESTAB  => CASE WHEN PCOD_ESTAB = 'TODOS' THEN NULL ELSE PCOD_ESTAB END,
                       P_DT_INIC   => PDATA_INI,
                       P_DT_FIM    => PDATA_FIM,
                       P_USUARIO   => PUSUARIO,
                       P_NUM_PROC  => VN_PROC_SAFX);
                       
      SAF_IMP_X10(P_CD_EMPR         => PCOD_EMPRESA,
                  P_CD_ESTAB        => CASE WHEN PCOD_ESTAB = 'TODOS' THEN NULL ELSE PCOD_ESTAB END,
                  P_DT_INIC         => PDATA_INI,
                  P_DT_FIM          => PDATA_FIM,
                  P_PERC_ERRO       => 100,
                  P_USUARIO         => PUSUARIO,
                  P_IND_DROP_TAB    => 'S',
                  P_IND_SP_REGISTRO => 'S',
                  P_IND_LIM_PERIODO => 'S',
                  P_NR_PROC         => VN_PROC_SAFX,
                  P_IND_ATO_COTEPE  => 'N',
                  P_STATUS          => VN_STATUS_SAFX,
                  P_NUM_LOTE        => NULL);
                     

          LIB_PROC.ADD_LOG('',1);
          LIB_PROC.ADD_LOG('SAFX10 IMPORTADA, VERIFIQUE O LOG DE PROCESSO DE IMPORTAÇÃO NÚMERO  '||VN_PROC_SAFX||' EM BASICOS > JOB SERVIDOR > CONTROLES > RELATÓRIO > RELATÓRIO POR PROCESSO > IMPORTAÇÃO PARA MAIORES DETALHES',1);
      
    END IF;
    
    
  END;
  -- FIM SAFX10

  -- INICIO SAFX2013
  BEGIN
    
    SELECT COUNT(*)
    INTO   VN_CONT_SAFX
    FROM   SAFX2013 A
    WHERE  1=1
    AND    TO_DATE(A.DATA_PRODUTO,'YYYYMMDD') BETWEEN PDATA_INI AND PDATA_FIM;
    
    
    IF VN_CONT_SAFX > 0 AND UPPER(PTABELA) = 'SAFX2013'
      THEN
        
      SAF_INI_PROCESSO(P_NOME_PROC => 'IMPX2013',
                       P_CD_EMPR   => PCOD_EMPRESA,
                       P_CD_ESTAB  => CASE WHEN PCOD_ESTAB = 'TODOS' THEN NULL ELSE PCOD_ESTAB END,
                       P_DT_INIC   => PDATA_INI,
                       P_DT_FIM    => PDATA_FIM,
                       P_USUARIO   => PUSUARIO,
                       P_NUM_PROC  => VN_PROC_SAFX);
                       
      SAF_IMP_X2013(P_CD_EMPR         => PCOD_EMPRESA,
                    P_CD_ESTAB        => CASE WHEN PCOD_ESTAB = 'TODOS' THEN NULL ELSE PCOD_ESTAB END,
                    P_DT_INIC         => PDATA_INI,
                    P_DT_FIM          => PDATA_FIM,
                    P_PERC_ERRO       => 100,
                    P_USUARIO         => PUSUARIO,
                    P_IND_DROP_TAB    => 'S',
                    P_IND_SP_REGISTRO => 'S',
                    P_NUM_JOB         => NULL,
                    P_NR_PROC         => VN_PROC_SAFX,
                    P_VALIDADE        => 'N',
                    P_STATUS          => VN_STATUS_SAFX,
                    P_NUM_LOTE        => NULL);
                       
                     

          LIB_PROC.ADD_LOG('',1);
          LIB_PROC.ADD_LOG('SAFX2013 IMPORTADA, VERIFIQUE O LOG DE PROCESSO DE IMPORTAÇÃO NÚMERO  '||VN_PROC_SAFX||' EM BASICOS > JOB SERVIDOR > CONTROLES > RELATÓRIO > RELATÓRIO POR PROCESSO > IMPORTAÇÃO PARA MAIORES DETALHES',1);
      
    END IF;
    
    
  END;
  -- FIM SAFX2013

  -- INICIO SAFX112
  BEGIN
    
    SELECT COUNT(*)
    INTO   VN_CONT_SAFX
    FROM   SAFX112 A
    WHERE  1=1
    AND    TO_DATE(A.DATA_FISCAL ,'YYYYMMDD') BETWEEN PDATA_INI AND PDATA_FIM;
    
    
    IF VN_CONT_SAFX > 0 AND UPPER(PTABELA) = 'SAFX112'
      THEN
        
      SAF_INI_PROCESSO(P_NOME_PROC => 'IMPX112',
                       P_CD_EMPR   => PCOD_EMPRESA,
                       P_CD_ESTAB  => CASE WHEN PCOD_ESTAB = 'TODOS' THEN NULL ELSE PCOD_ESTAB END,
                       P_DT_INIC   => PDATA_INI,
                       P_DT_FIM    => PDATA_FIM,
                       P_USUARIO   => PUSUARIO,
                       P_NUM_PROC  => VN_PROC_SAFX);
                       
      SAF_IMP_X112(P_CD_EMPR         => PCOD_EMPRESA,
                   P_CD_ESTAB        => CASE WHEN PCOD_ESTAB = 'TODOS' THEN NULL ELSE PCOD_ESTAB END,
                   P_DT_INIC         => PDATA_INI,
                   P_DT_FIM          => PDATA_FIM,
                   P_PERC_ERRO       => 100,
                   P_USUARIO         => PUSUARIO,
                   P_IND_DROP_TAB    => 'S',
                   P_IND_SP_REGISTRO => 'S',
                   P_IND_LIM_PERIODO => 'S',
                   P_NR_PROC         => VN_PROC_SAFX,
                   P_STATUS          => VN_STATUS_SAFX,
                   P_NUM_LOTE        => NULL);
                     

          LIB_PROC.ADD_LOG('',1);
          LIB_PROC.ADD_LOG('SAFX112 IMPORTADA, VERIFIQUE O LOG DE PROCESSO DE IMPORTAÇÃO NÚMERO  '||VN_PROC_SAFX||' EM BASICOS > JOB SERVIDOR > CONTROLES > RELATÓRIO > RELATÓRIO POR PROCESSO > IMPORTAÇÃO PARA MAIORES DETALHES',1);
      
    END IF;
    
    
  END;
  -- FIM SAFX112

  -- INICIO SAFX113
  BEGIN
    
    SELECT COUNT(*)
    INTO   VN_CONT_SAFX
    FROM   SAFX113 A
    WHERE  1=1
    AND    TO_DATE(A.DATA_FISCAL ,'YYYYMMDD') BETWEEN PDATA_INI AND PDATA_FIM;
    
    
    IF VN_CONT_SAFX > 0 AND UPPER(PTABELA) = 'SAFX113'
      THEN
        
      SAF_INI_PROCESSO(P_NOME_PROC => 'IMPX113',
                       P_CD_EMPR   => PCOD_EMPRESA,
                       P_CD_ESTAB  => CASE WHEN PCOD_ESTAB = 'TODOS' THEN NULL ELSE PCOD_ESTAB END,
                       P_DT_INIC   => PDATA_INI,
                       P_DT_FIM    => PDATA_FIM,
                       P_USUARIO   => PUSUARIO,
                       P_NUM_PROC  => VN_PROC_SAFX);
                       
      SAF_IMP_X113(P_CD_EMPR         => PCOD_EMPRESA,
                   P_CD_ESTAB        => CASE WHEN PCOD_ESTAB = 'TODOS' THEN NULL ELSE PCOD_ESTAB END,
                   P_DT_INIC         => PDATA_INI,
                   P_DT_FIM          => PDATA_FIM,
                   P_PERC_ERRO       => 100,
                   P_USUARIO         => PUSUARIO,
                   P_IND_DROP_TAB    => 'S',
                   P_IND_SP_REGISTRO => 'S',
                   P_IND_LIM_PERIODO => 'S',
                   P_NR_PROC         => VN_PROC_SAFX,
                   P_STATUS          => VN_STATUS_SAFX,
                   P_NUM_LOTE        => NULL);
                     

          LIB_PROC.ADD_LOG('',1);
          LIB_PROC.ADD_LOG('SAFX113 IMPORTADA, VERIFIQUE O LOG DE PROCESSO DE IMPORTAÇÃO NÚMERO  '||VN_PROC_SAFX||' EM BASICOS > JOB SERVIDOR > CONTROLES > RELATÓRIO > RELATÓRIO POR PROCESSO > IMPORTAÇÃO PARA MAIORES DETALHES',1);
      
    END IF;
    
    
  END;
  -- FIM SAFX113




  END;*/



END;
/

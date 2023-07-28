CREATE OR REPLACE PACKAGE MSAF_EXPORTA_NOTA_CPROC IS

  /*-------------------------------------------------------------------------------------
  Pacote para a exportacao dos registros no formato SAFX dos registros de x07
  x08,x09 utilizando como base os fontes da Thomson.
  
  Esse objeto foi criado atraves do objeto standard "pkg_exporta_nota", para
  evitar erros na execucao do customizado caso hajam alteracoes em "pkg_exporta_nota"
  Futuras alteracoes podem ser replicados de "pkg_exporta_nota" para este objeto
  -------------------------------------------------------------------------------------*/

  Function X07(p_Cod_Empresa                 in Varchar2,
               p_Cod_Estab                   in Varchar2,
               p_Data_Fiscal                 in DATE,
               p_Movto_e_s                   in Varchar2,
               p_Norm_Dev                    in Varchar2,
               p_Ident_Docto                 in Number,
               p_Ident_Fis_Jur               in Number,
               p_Num_Docfis                  in Varchar2,
               p_Serie_Docfis                in Varchar2,
               p_Sub_Serie_Docfis            in Varchar2,
               p_Data_Emissao                in DATE,
               p_Cod_Class_Doc_Fis           in Varchar2,
               p_Ident_Modelo                in Number,
               p_Ident_Cfo                   in Number,
               p_Ident_Natureza_Op           in Number,
               p_Num_Docfis_Ref              in Varchar2,
               p_Serie_Docfis_Ref            in Varchar2,
               p_s_Ser_Docfis_Ref            in Varchar2,
               p_Num_Dec_Imp_Ref             in Varchar2,
               p_Data_Saida_Rec              in DATE,
               p_Insc_Estad_Substit          in Varchar2,
               p_Vlr_Produto                 in Number,
               p_Vlr_Tot_Nota                in Number,
               p_Vlr_Frete                   in Number,
               p_Vlr_Seguro                  in Number,
               p_Vlr_Outras                  in Number,
               p_Vlr_Base_Dif_Frete          in Number,
               p_Vlr_Desconto                in Number,
               p_Contrib_Final               in Varchar2,
               p_Situacao                    in Varchar2,
               p_Cod_Indice                  in Varchar2,
               p_Vlr_Nota_Conv               in Number,
               p_Ident_Conta                 in Number,
               p_Ind_Modelo_Cupom            in Varchar2,
               p_Num_Processo                in Number,
               p_Ind_Gravacao                IN VARCHAR2,
               p_Vlr_Contab_Compl            in Number,
               p_Num_Controle_Docto          in Varchar2,
               p_Vlr_Aliq_Destino            in Number,
               p_Vlr_Outros1                 in Number,
               p_Vlr_Outros2                 in Number,
               p_Vlr_Outros3                 in Number,
               p_Vlr_Outros4                 in Number,
               p_Vlr_Outros5                 in Number,
               p_Vlr_Aliq_Outros1            in Number,
               p_Vlr_Aliq_Outros2            in Number,
               p_Ind_Nf_Especial             IN VARCHAR2,
               p_Ind_Tp_Frete                IN VARCHAR2,
               p_Cod_Municipio               in Number,
               p_Ind_Transf_Cred             IN VARCHAR2,
               p_Dat_Di                      IN DATE,
               p_Vlr_Tom_Servico             in Number,
               p_Dat_Escr_Extemp             IN DATE,
               p_Cod_Trib_Int                in Number,
               p_Cod_Regiao                  in Number,
               p_Dat_Autentic                IN DATE,
               p_Cod_Canal_Distrib           in Varchar2,
               p_Vlr_Icms_Ndestac            in Number,
               p_Vlr_Ipi_Ndestac             in Number,
               p_Vlr_Base_Inss               in Number,
               p_Vlr_Aliq_Inss               in Number,
               p_Vlr_Inss_Retido             in Number,
               p_Vlr_Mat_Aplic_Iss           in Number,
               p_Vlr_Subempr_Iss             in Number,
               p_Ind_Munic_Iss               IN VARCHAR2,
               p_Ind_Classe_Op_Iss           IN VARCHAR2,
               p_Dat_Fato_Gerador            IN DATE,
               p_Dat_Cancelamento            IN DATE,
               p_Num_Pagina                  in Varchar2,
               p_Num_Livro                   in Varchar2,
               p_Nro_Aidf_Nf                 in Varchar2,
               p_Dat_Valid_Doc_Aidf          IN DATE,
               p_Ind_Fatura                  IN VARCHAR2,
               p_Ident_Quitacao              in Number,
               p_Num_Selo_Cont_Icms          in Varchar2,
               p_Vlr_Base_Pis                in Number,
               p_Vlr_Pis                     in Number,
               p_Vlr_Base_Cofins             in Number,
               p_Vlr_Cofins                  in Number,
               p_Base_Icms_Origdest          in Number,
               p_Vlr_Icms_Origdest           in Number,
               p_Aliq_Icms_Origdest          in Number,
               p_Vlr_Desc_Condic             in Number,
               p_Perc_Red_Base_Icms          in Number,
               p_Ident_Fisjur_Cpdir          in Number,
               p_Ind_Medidajudicial          IN VARCHAR2,
               p_Ident_Uf_Orig_Dest          in Number,
               p_Ind_Compra_Venda            in Varchar2,
               p_Cod_Tp_Disp_Seg             in Varchar2,
               p_Num_Ctr_Disp                in Number,
               p_Num_Fim_Docto               in Varchar2,
               p_Ident_Uf_Destino            in Number,
               p_Serie_Ctr_Disp              in Varchar2,
               p_Sub_Serie_Ctr_Disp          in Varchar2,
               p_Ind_Situacao_Esp            IN VARCHAR2,
               p_Insc_Estadual               in Varchar2,
               p_Cod_Pagto_Inss              in Varchar2,
               p_Dat_Operacao                IN DATE,
               p_Usuario                     in Varchar2,
               p_Dat_Intern_Am               IN DATE,
               p_Ident_Fisjur_Lsg            in Number,
               p_Comprov_Exp                 in Varchar2,
               p_Num_Final_Crt_Disp          in Number,
               p_Num_Alvara                  in Varchar2,
               p_Notifica_Sefaz              in Varchar2,
               p_Interna_Suframa             in Varchar2,
               p_Cod_Amparo                  in Varchar2,
               p_Ident_Estado_Ampar          in Number,
               p_Ind_Nota_Servico            IN VARCHAR2,
               p_Cod_Motivo                  in Varchar2,
               p_Obs_Compl_Motivo            in Varchar2,
               p_Ind_Tp_Ret                  IN VARCHAR2,
               p_Ind_Tp_Tomador              IN VARCHAR2,
               p_Cod_Antec_St                in Varchar2,
               p_Cnpj_Armaz_Orig             in Varchar2,
               p_Ident_Uf_Armaz_Orig         in Number,
               p_Ins_Est_Armaz_Orig          in Varchar2,
               p_Cnpj_Armaz_Dest             in Varchar2,
               p_Ident_Uf_Armaz_Dest         in Number,
               p_Ins_Est_Armaz_Dest          in Varchar2,
               p_Obs_Inf_Adic_Nf             in Varchar2,
               p_Vlr_Base_Inss_2             in Number,
               p_Vlr_Aliq_Inss_2             in Number,
               p_Vlr_Inss_Retido_2           in Number,
               p_Cod_Pagto_Inss_2            in Varchar2,
               p_Vlr_Base_Pis_St             in Number,
               p_Vlr_Aliq_Pis_St             in Number,
               p_Vlr_Pis_St                  in Number,
               p_Vlr_Base_Cofins_St          in Number,
               p_Vlr_Aliq_Cofins_St          in Number,
               p_Vlr_Cofins_St               in Number,
               p_Vlr_Base_Csll               in Number,
               p_Vlr_Aliq_Csll               in Number,
               p_Vlr_Csll                    in Number,
               p_Vlr_Aliq_Pis                in Number,
               p_Vlr_Aliq_Cofins             in Number,
               p_Base_Icmss_Substituido      in Number,
               p_Vlr_Icmss_Substituido       in Number,
               p_Ind_Situacao_Esp_St         IN VARCHAR2,
               p_Vlr_Icmss_Ndestac           in Number,
               p_Ind_Docto_Rec               IN VARCHAR2,
               p_Dat_Pgto_Gnre_Darj          IN DATE,
               p_Cod_Cei                     in Varchar2,
               p_Vlr_Juros_Inss              in Number,
               p_Vlr_Multa_Inss              in Number,
               p_Dt_Pagto_Nf                 IN DATE,
               p_Ind_Origem_Info             IN VARCHAR2,
               p_Hora_Saida                  in Number,
               p_Cod_Sit_Docfis              in Varchar2,
               p_Ident_Observacao            in Number,
               p_Ident_Situacao_a            in Number,
               p_Ident_Situacao_b            in Number,
               p_Num_Ciclo                   in Varchar2,
               p_Cod_Municipio_Orig          in Number,
               p_Cod_Municipio_Dest          in Number,
               p_Cod_Cfps                    in Varchar2,
               p_Num_Lancamento              in Varchar2,
               p_Vlr_Mat_Prop                in Number,
               p_Vlr_Mat_Terc                in Number,
               p_Vlr_Base_Iss_Retido         in Number,
               p_Vlr_Iss_Retido              in Number,
               p_Vlr_Deducao_Iss             in Number,
               p_Cod_Munic_Armaz_Orig        in Number,
               p_Ins_Munic_Armaz_Orig        in Varchar2,
               p_Cod_Munic_Armaz_Dest        in Number,
               p_Ins_Munic_Armaz_Dest        in Varchar2,
               p_Ident_Classe_Consumo        in Number,
               p_Ind_Especif_Receita         IN VARCHAR2,
               p_Num_Contrato                in Varchar2,
               p_Cod_Area_Terminal           in Varchar2,
               p_Cod_Tp_Util                 in Varchar2,
               p_Grupo_Tensao                in Varchar2,
               p_Data_Consumo_Ini            in DATE,
               p_Data_Consumo_Fim            in DATE,
               p_Data_Consumo_Leit           IN DATE,
               p_Qtd_Contratada_Ponta        in Number,
               p_Qtd_Contratada_Fponta       in Number,
               p_Qtd_Consumo_Total           in Number,
               p_Ident_Uf_Consumo            in Number,
               p_Cod_Munic_Consumo           in Number,
               p_Cod_Oper_Esp_St             in Varchar2,
               p_Ato_Normativo               in Varchar2,
               p_Num_Ato_Normativo           in Number,
               p_Ano_Ato_Normativo           in Number,
               p_Capitulacao_Norma           in Varchar2,
               p_Vlr_Outras_Entid            in Number,
               p_Vlr_Terceiros               in Number,
               p_Ind_Tp_Compl_Icms           in Varchar2,
               p_Vlr_Base_Cide               in Varchar2,
               p_Vlr_Aliq_Cide               in Varchar2,
               p_Vlr_Cide                    in Varchar2,
               p_Cod_Verific_Nfe             in Varchar2, -- OS2286
               p_Cod_Tp_Rps_Nfe              in Varchar2, -- OS2286
               p_Num_Rps_Nfe                 in Number, -- OS2286
               p_Serie_Rps_Nfe               in Varchar2, -- OS2286
               p_Dat_Emissao_Rps_Nfe         in DATE, -- OS2286
               p_Dsc_Servico_Nfe             in Varchar2, -- OS2286
               p_Num_Autentic_Nfe            in Varchar2, -- OS2295
               p_Num_Dv_Nfe                  IN VARCHAR2, -- CH33683
               p_Modelo_Nf_Dms               in Varchar2, -- OS 2313
               p_Cod_Modelo_Cotepe           in Varchar2, -- OS2354
               p_Vlr_Comissao                in Varchar2, -- OS2403
               p_Ind_Nfe_Deneg_Inut          In Number, -- OS2388-B
               p_Ind_Nf_Reg_Especial         In Varchar2, -- OS2388-B
               p_Vlr_Abat_Ntributado         In Number, -- OS2388-B
               p_Vlr_Outros_Icms             In Number,
               p_Hora_Emissao                in Number, -- OS2466-A
               p_Obs_Dados_Fatura            in Varchar2, -- OS2466-A
               p_Ident_Fis_Conces            in Number, -- OS2388-Pdw
               p_Cod_Autentic                in Varchar2,
               p_Ind_Port_Cat44              IN VARCHAR2,
               p_VLR_BASE_INSS_RURAL         in Varchar2, --OS2388-B2
               p_VLR_ALIQ_INSS_RURAL         in Varchar2, --OS2388-B2
               p_VLR_INSS_RURAL              in Varchar2,
               p_Ident_Classe_Consumo_sef_pe in Number, --OS2388-B2
               P_VLR_PIS_RETIDO              IN NUMBER, -- 3169-DW1
               P_VLR_COFINS_RETIDO           IN NUMBER, -- 3169-DW1
               P_DAT_LANC_PIS_COFINS         IN DATE, -- 3169-DW1
               P_IND_PIS_COFINS_EXTEMP       IN VARCHAR2, -- 3169-DW1
               P_COD_SIT_PIS                 IN NUMBER, -- 3169-DW1
               P_COD_SIT_COFINS              IN NUMBER, -- 3169-DW1
               P_IND_NAT_FRETE               IN VARCHAR2,
               P_COD_NAT_REC                 IN NUMBER,
               P_IND_VENDA_CANC              IN VARCHAR2, -- 3169-GE13
               P_IND_NAT_BASE_CRED           IN Varchar2, --3169-GE13B
               P_IND_NF_CONTINGENCIA         IN Varchar2,
               P_VLR_ACRESCIMO               IN NUMBER,
               P_VLR_ANTECIP_TRIB            IN NUMBER,
               P_DSC_RESERVADO1              IN VARCHAR2, --3521
               P_DSC_RESERVADO2              IN VARCHAR2, --3521
               P_DSC_RESERVADO3              IN VARCHAR2, --3521
               P_NUM_NFTS                    IN VARCHAR2,
               P_IND_NF_VENDA_TERCEIROS      IN VARCHAR2,
               P_DSC_RESERVADO4              IN VARCHAR2, --3749
               P_DSC_RESERVADO5              IN VARCHAR2, --3749
               P_DSC_RESERVADO6              IN NUmber, --3749
               P_DSC_RESERVADO7              IN Number, --3749
               P_DSC_RESERVADO8              IN Number, --3749
               P_IDENTIF_DOCFIS              IN VARCHAR2, --3743
               P_COD_SISTEMA_ORIG            IN VARCHAR2, --3743
               P_IDENT_SCP                   IN NUMBER, --OS4316

               P_IND_PREST_SERV  IN VARCHAR2, -- OS 4514
               P_IND_TIPO_PROC   IN VARCHAR2, -- OS 4514
               P_NUM_PROC_JUR    IN VARCHAR2, -- OS 4514
               P_IND_DEC_PROC    IN VARCHAR2, -- OS 4514
               P_IND_TIPO_AQUIS  IN VARCHAR2, -- OS 4514
               P_VLR_DESC_GILRAT IN NUMBER, -- OS 4514
               P_VLR_DESC_SENAR  IN NUMBER, -- OS 4514

               P_CNPJ_SUBEMPREITEIRO       IN VARCHAR2,
               P_CNPJ_CPF_PROPRIETARIO_CNO IN VARCHAR2,
               P_VLR_RET_SUBEMPREITADO     IN NUMBER,

               P_NUM_DOCFIS_SERV IN VARCHAR2 --OS 3341

              ,
               P_VLR_FCP_UF_DEST  IN NUMBER -- MFS2101
              ,
               P_VLR_ICMS_UF_DEST IN NUMBER -- MFS2101
              ,
               P_VLR_ICMS_UF_ORIG IN NUMBER -- MFS2101

              ,
               P_VLR_CONTRIB_PREV        IN NUMBER --MFS2967
              ,
               P_VLR_GILRAT              IN NUMBER --MFS2967
              ,
               P_VLR_CONTRIB_SENAR       IN NUMBER --OS2967
              ,
               P_CPF_CNPJ                IN VARCHAR2 --MFS11800
              ,
               P_NUM_CERTIF_QUAL         IN VARCHAR2 --MFS13120
              ,
               P_OBS_REINF               IN VARCHAR2 --MFS14129
              ,
               P_VLR_TOT_ADIC            IN NUMBER,
               P_VLR_RET_SERV            IN NUMBER,
               P_VLR_SERV_15             IN NUMBER,
               P_VLR_SERV_20             IN NUMBER,
               P_VLR_SERV_25             IN NUMBER,
               P_VLR_IPI_DEV             IN NUMBER --MFS20985
              ,
               P_VLR_SEST                IN NUMBER,
               P_VLR_SENAT               IN NUMBER,
               P_IND_FIN_EMISSAO_NFE     IN VARCHAR2,
               P_NUM_AUTENTIC_NFE_SUBST  IN VARCHAR2,
               P_IND_VLR_ICMS_COB_ANT_ST IN VARCHAR2) Return Long;

  Function X08(p_Cod_Empresa             IN Varchar2,
               p_Cod_Estab               IN Varchar2,
               p_Data_Fiscal             IN DATE,
               p_Movto_e_s               IN VARCHAR2,
               p_Norm_Dev                IN VARCHAR2,
               p_Ident_Docto             IN Number,
               p_Ident_Fis_Jur           IN Number,
               p_Num_Docfis              IN Varchar2,
               p_Serie_Docfis            IN Varchar2,
               p_Sub_Serie_Docfis        IN Varchar2,
               p_Discri_Item             IN Varchar2,
               p_Ident_Produto           IN Number,
               p_Ident_Und_Padrao        IN Number,
               p_Cod_Bem                 IN Varchar2,
               p_Cod_Inc_Bem             IN Varchar2,
               p_Valid_Bem               IN DATE,
               p_Num_Item                IN Number,
               p_Ident_Almox             IN Number,
               p_Ident_Custo             IN Number,
               p_Descricao_Compl         IN Varchar2,
               p_Ident_Cfo               IN Number,
               p_Ident_Natureza_Op       IN Number,
               p_Ident_Nbm               IN Number,
               p_Quantidade              IN Number,
               p_Ident_Medida            IN Number,
               p_Vlr_Unit                IN Number,
               p_Vlr_Item                IN Number,
               p_Vlr_Desconto            IN Number,
               p_Vlr_Frete               IN Number,
               p_Vlr_Seguro              IN Number,
               p_Vlr_Outras              IN Number,
               p_Ident_Situacao_a        IN Number,
               p_Ident_Situacao_b        IN Number,
               p_Ident_Federal           IN Number,
               p_Ind_Ipi_Incluso         IN VARCHAR2,
               p_Num_Romaneio            IN Varchar2,
               p_Data_Romaneio           IN DATE,
               p_Peso_Liquido            IN Number,
               p_Cod_Indice              IN Varchar2,
               p_Vlr_Item_Conver         IN Number,
               p_Num_Processo            IN Number,
               p_Ind_Gravacao            IN VARCHAR2,
               p_Vlr_Contab_Compl        IN Number,
               p_Vlr_Aliq_Destino        IN Number,
               p_Vlr_Outros1             IN Number,
               p_Vlr_Outros2             IN Number,
               p_Vlr_Outros3             IN Number,
               p_Vlr_Outros4             IN Number,
               p_Vlr_Outros5             IN Number,
               p_Vlr_Aliq_Outros1        IN Number,
               p_Vlr_Aliq_Outros2        IN Number,
               p_Vlr_Contab_Item         IN Number,
               p_Cod_Obs_Vcont_Comp      IN Varchar2,
               p_Cod_Obs_Vcont_Item      IN Varchar2,
               p_Vlr_Outros_Icms         IN Number,
               p_Vlr_Outros_Ipi          IN Number,
               p_Ind_Resp_Vcont_Itm      IN VARCHAR2,
               p_Num_Ato_Conces          IN Varchar2,
               p_Dat_Embarque            IN DATE,
               p_Num_Reg_Exp             IN Varchar2,
               p_Num_Desp_Exp            IN Varchar2,
               p_Vlr_Tom_Servico         IN Number,
               p_Vlr_Desp_Moeda_Exp      IN Number,
               p_Cod_Moeda_Negoc         IN Varchar2,
               p_Cod_Pais_Dest_Orig      IN Varchar2,
               p_Cod_Trib_Int            IN Number,
               p_Vlr_Icms_Ndestac        IN Number,
               p_Vlr_Ipi_Ndestac         IN Number,
               p_Vlr_Base_Pis            IN Number,
               p_Vlr_Pis                 IN Number,
               p_Vlr_Base_Cofins         IN Number,
               p_Vlr_Cofins              IN Number,
               p_Base_Icms_Origdest      IN Number,
               p_Vlr_Icms_Origdest       IN Number,
               p_Aliq_Icms_Origdest      IN Number,
               p_Vlr_Desc_Condic         IN Number,
               p_Vlr_Custo_Transf        IN Number,
               p_Perc_Red_Base_Icms      IN Number,
               p_Qtd_Embarcada           IN Number,
               p_Dat_Registro_Exp        IN DATE,
               p_Dat_Despacho            IN DATE,
               p_Dat_Averbacao           IN DATE,
               p_Dat_Di                  IN DATE,
               p_Num_Dec_Imp_Ref         IN Varchar2,
               p_Dsc_Mot_Ocor            IN Varchar2,
               p_Ident_Conta             IN Number,
               p_Vlr_Base_Icms_Orig      IN Number,
               p_Vlr_Trib_Icms_Orig      IN Number,
               p_Vlr_Base_Icms_Dest      IN Number,
               p_Vlr_Trib_Icms_Dest      IN Number,
               p_Vlr_Perc_Pres_Icms      IN Number,
               p_Vlr_Preco_Base_St       IN Number,
               p_Ident_Oper_Oil          IN Number,
               p_Cod_Dcr                 IN Varchar2,
               p_Ident_Projeto           IN Number,
               p_Dat_Operacao            IN DATE,
               p_Usuario                 IN Varchar2,
               p_Ind_Mov_Fis             IN VARCHAR2,
               p_Chassi                  IN Varchar2,
               p_Num_Docfis_Ref          IN Varchar2,
               p_Serie_Docfis_Ref        IN Varchar2,
               p_Sserie_Docfis_Ref       IN Varchar2,
               p_Vlr_Base_Pis_St         IN Number,
               p_Vlr_Aliq_Pis_St         IN Number,
               p_Vlr_Pis_St              IN Number,
               p_Vlr_Base_Cofins_St      IN Number,
               p_Vlr_Aliq_Cofins_St      IN Number,
               p_Vlr_Cofins_St           IN Number,
               p_Vlr_Base_Csll           IN Number,
               p_Vlr_Aliq_Csll           IN Number,
               p_Vlr_Csll                IN Number,
               p_Vlr_Aliq_Pis            IN Number,
               p_Vlr_Aliq_Cofins         IN Number,
               p_Ind_Situacao_Esp_St     IN VARCHAR2,
               p_Vlr_Icmss_Ndestac       IN Number,
               p_Ind_Docto_Rec           IN VARCHAR2,
               p_Dat_Pgto_Gnre_Darj      IN DATE,
               p_Vlr_Custo_Unit          IN Number,
               p_Quantidade_Conv         IN Number,
               p_Vlr_Fecp_Icms           IN Number,
               p_Vlr_Fecp_Difaliq        IN Number,
               p_Vlr_Fecp_Icms_St        IN Number,
               p_Vlr_Fecp_Fonte          IN Number,
               p_Vlr_Base_Icmss_n_Escrit IN Number,
               p_Vlr_Icmss_n_Escrit      IN Number,
               p_Cod_Trib_Ipi            IN Varchar2,
               p_Lote_Medicamento        IN Varchar2,
               p_Valid_Medicamento       IN DATE,
               p_Ind_Base_Medicamento    IN VARCHAR2,
               p_Vlr_Preco_Medicamento   IN Number,
               p_Ind_Tipo_Arma           IN VARCHAR2,
               p_Num_Serie_Arma          IN Varchar2,
               p_Num_Cano_Arma           IN Varchar2,
               p_Dsc_Arma                IN Varchar2,
               p_Ident_Observacao        IN Varchar2,
               p_Cod_Ex_Ncm              IN Varchar2,
               p_Cod_Ex_Imp              IN Varchar2,
               p_Cnpj_Operadora          IN Varchar2,
               p_Cpf_Operadora           IN Varchar2,
               p_Ident_Uf_Operadora      IN Number,
               p_Ins_Est_Operadora       IN Varchar2,
               p_Ind_Especif_Receita     IN VARCHAR2,
               p_Cod_Class_Item          IN Varchar2,
               p_Vlr_Preco_Suger         IN Number,
               p_Vlr_Terceiros           IN Number,
               p_Vlr_Base_Cide           IN Varchar2,
               p_Vlr_Aliq_Cide           IN Varchar2,
               p_Vlr_Cide                IN Varchar2,
               p_Cod_Oper_Esp_St         IN Varchar2,
               p_Vlr_Comissao            IN Varchar2,
               p_Vlr_Icms_Frete          IN Varchar2, -- OS 2379
               p_Vlr_Difal_Frete         IN Varchar2, -- OS 2379
               p_Ind_Vlr_Pis_Cofins      IN Varchar2, -- OS 2386
               p_Cod_Enquad_Ipi          IN Varchar2,
               p_Cod_Situacao_Pis        IN Number,
               p_Qtd_Base_Pis            IN Number,
               p_Vlr_Aliq_Pis_r          IN Number,
               p_Cod_Situacao_Cofins     IN Number,
               p_Qtd_Base_Cofins         IN Number,
               p_Vlr_Aliq_Cofins_r       IN Number,
               p_Item_Port_Tare          IN Varchar2,
               p_Vlr_Funrural            IN Number,
               p_Ind_Tp_Prod_Medic       IN Varchar2,
               p_Vlr_Custo_dca           IN Number,
               p_Cod_Tp_Lancto           IN Number,
               p_Vlr_Perc_Cred_Out       IN Number,
               p_Vlr_Cred_Out            IN Number,
               p_Vlr_ICMS_Dca            IN Number,
               p_Vlr_PIS_Exp             IN Number,
               p_Vlr_PIS_Trib            IN Number,
               p_Vlr_PIS_N_Trib          IN Number,
               p_Vlr_Cofins_Exp          IN Number,
               p_Vlr_Cofins_Trib         IN Number,
               p_Vlr_Cofins_N_Trib       IN Number,
               p_Cod_Enq_Legal           IN Number,
               p_Ind_gravacao_saics      IN Varchar2,
               P_DAT_LANC_PIS_COFINS     IN DATE, -- 3169-DW1
               P_IND_PIS_COFINS_EXTEMP   IN VARCHAR2, -- 3169-DW1
               P_IND_NATUREZA_FRETE      IN VARCHAR2, -- 3169-DW1
               P_COD_NAT_REC             IN NUMBER, -- 3169-DW11
               P_IND_NAT_BASE_CRED       IN Varchar2,
               P_VLR_ACRESCIMO           IN NUMBER,
               P_DSC_RESERVADO1          IN VARCHAR2, --3521
               P_DSC_RESERVADO2          IN VARCHAR2, --3521
               P_DSC_RESERVADO3          IN VARCHAR2, --3521
               P_COD_TRIB_PROD           IN VARCHAR2, -- OS3663
               P_DSC_RESERVADO4          IN VARCHAR2, --3749
               P_DSC_RESERVADO5          IN VARCHAR2, --3749
               P_DSC_RESERVADO6          IN Number, --3749
               P_DSC_RESERVADO7          IN Number, --3749
               P_DSC_RESERVADO8          IN Number, --3749
               P_INDICE_PROD_ACAB        IN VARCHAR2, -- OS 3663-B
               P_VLR_BASE_DIA_AM         IN Number,
               P_VLR_ALIQ_DIA_AM         IN Number,
               P_VLR_ICMS_DIA_AM         IN Number,
               P_VLR_ADUANEIRO           IN Number,
               P_COD_SITUACAO_PIS_ST     IN Number,
               P_COD_SITUACAO_COFINS_ST  IN Number,
               P_VLR_ALIQ_DCIP           IN Number,
               P_NUM_LI                  IN VARCHAR2 --MFS1750

              ,
               P_VLR_FCP_UF_DEST  IN NUMBER -- MFS2101
              ,
               P_VLR_ICMS_UF_DEST IN NUMBER -- MFS2101
              ,
               P_VLR_ICMS_UF_ORIG IN NUMBER -- MFS2101
              ,
               P_VLR_DIF_DUB      IN NUMBER --MFS 3484

              ,
               P_VLR_ICMS_NAO_DEST      IN NUMBER -- MFS 4881
              ,
               P_VLR_BASE_ICMS_NAO_DEST IN NUMBER,
               P_VLR_ALIQ_ICMS_NAO_DEST IN NUMBER,
               P_IND_MOTIVO_RES         IN VARCHAR2,
               P_NUM_DOCFIS_RET         IN VARCHAR2,
               P_SERIE_DOCFIS_RET       IN VARCHAR2,
               P_NUM_AUTENTIC_NFE_RET   IN VARCHAR2,
               P_NUM_ITEM_RET           IN NUMBER,
               P_IDENT_FIS_JUR_RET      IN NUMBER,
               P_IND_TP_DOC_ARREC       IN VARCHAR2,
               P_NUM_DOC_ARREC          IN VARCHAR2,
               P_IDENT_CFO_DCIP         IN VARCHAR2

              ,
               P_VLR_BASE_INSS         IN NUMBER,
               P_VLR_INSS_RETIDO       IN NUMBER,
               P_VLR_TOT_ADIC          IN NUMBER,
               P_VLR_N_RET_PRINC       IN NUMBER,
               P_VLR_N_RET_ADIC        IN NUMBER,
               P_VLR_ALIQ_INSS         IN NUMBER,
               P_VLR_RET_SERV          IN NUMBER,
               P_VLR_SERV_15           IN NUMBER,
               P_VLR_SERV_20           IN NUMBER,
               P_VLR_SERV_25           IN NUMBER,
               P_IND_TP_PROC_ADJ_PRINC IN VARCHAR2,
               P_IDENT_PROC_ADJ_PRINC  IN NUMBER,
               P_IDENT_SUSP_TBT_PRINC  IN NUMBER,
               P_NUM_PROC_ADJ_PRINC    IN VARCHAR2,
               P_IND_TP_PROC_ADJ_ADIC  IN VARCHAR2,
               P_IDENT_PROC_ADJ_ADIC   IN NUMBER,
               P_IDENT_SUSP_TBT_ADIC   IN NUMBER,
               P_NUM_PROC_ADJ_ADIC     IN VARCHAR2
               --I.MFS20985
              ,
               P_VLR_IPI_DEV         IN NUMBER,
               P_COD_BENEFICIO       IN VARCHAR2,
               P_VLR_ABAT_NTRIBUTADO IN NUMBER,
               P_VLR_CREDITO_MVA_SN  IN NUMBER,
               P_VLR_DESONERADO_ICMS IN NUMBER,
               P_VLR_DIFERIDO_ICMS   IN NUMBER,
               P_VLR_EXC_BC_PIS      IN NUMBER,
               P_VLR_EXC_BC_COFINS   IN NUMBER,
               P_COD_CSOSN           IN VARCHAR2,
               P_VLR_FECP_ALIQ_ICMS  IN NUMBER) Return Long;

  Function X09(p_Cod_Empresa           IN Varchar2,
               p_Cod_Estab             IN Varchar2,
               p_Data_Fiscal           IN DATE,
               p_Movto_e_s             IN VARCHAR2,
               p_Norm_Dev              IN VARCHAR2,
               p_Ident_Docto           IN Number,
               p_Ident_Fis_Jur         IN Number,
               p_Num_Docfis            IN Varchar2,
               p_Serie_Docfis          IN Varchar2,
               p_Sub_Serie_Docfis      IN Varchar2,
               p_Ident_Servico         IN Number,
               p_Num_Item              IN Number,
               p_Descricao_Compl       IN Varchar2,
               p_Ident_Cfo             IN Number,
               p_Ident_Natureza_Op     IN Number,
               p_Quantidade            IN Number,
               p_Vlr_Unit              IN Number,
               p_Vlr_Servico           IN Number,
               p_Vlr_Desconto          IN Number,
               p_Vlr_Tot               IN Number,
               p_Contrato              IN Varchar2,
               p_Cod_Indice            IN Varchar2,
               p_Vlr_Servico_Conv      IN Number,
               p_Num_Processo          IN Number,
               p_Ind_Gravacao          IN VARCHAR2,
               p_Ident_Produto         IN Number,
               p_Dat_Operacao          IN DATE,
               p_Usuario               IN Varchar2,
               p_Compl_Isencao         IN Varchar2,
               p_Vlr_Base_Csll         IN Number,
               p_Vlr_Aliq_Csll         IN Number,
               p_Vlr_Csll              IN Number,
               p_Vlr_Base_Pis          IN Number,
               p_Vlr_Aliq_Pis          IN Number,
               p_Vlr_Pis               IN Number,
               p_Vlr_Base_Cofins       IN Number,
               p_Vlr_Aliq_Cofins       IN Number,
               p_Vlr_Cofins            IN Number,
               p_Ident_Conta           IN Number,
               p_ident_observacao      IN Number,
               p_cod_trib_iss          IN Varchar2,
               p_vlr_mat_prop          IN Number,
               p_vlr_mat_terc          IN Number,
               p_VLR_BASE_ISS_RETIDO   IN Number,
               p_VLR_ISS_RETIDO        IN Number,
               p_VLR_DEDUCAO_ISS       IN Number,
               p_VLR_SUBEMPR_ISS       IN Number,
               p_COD_CFPS              IN Varchar2,
               p_VLR_OUT_DESP          IN Number,
               p_VLR_BASE_CIDE         IN Number,
               p_VLR_ALIQ_CIDE         IN Number,
               p_VLR_CIDE              IN Number,
               p_VLR_COMISSAO          IN Number,
               p_IND_VLR_PIS_COFINS    IN VARCHAR2,
               p_COD_SITUACAO_PIS      IN Number,
               p_COD_SITUACAO_COFINS   IN Number,
               p_VLR_PIS_EXP           IN Number,
               p_VLR_PIS_TRIB          IN Number,
               p_VLR_PIS_N_TRIB        IN Number,
               p_VLR_COFINS_EXP        IN Number,
               p_VLR_COFINS_TRIB       IN Number,
               p_VLR_COFINS_N_TRIB     IN Number,
               p_VLR_PIS_RETIDO        IN Number, -- 3169-DW1
               p_VLR_COFINS_RETIDO     IN Number, -- 3169-DW1
               p_DAT_LANC_PIS_COFINS   IN DATE, -- 3169-DW1
               p_IND_PIS_COFINS_EXTEMP IN VARCHAR2, -- 3169-DW1
               p_IND_LOCAL_EXEC_SERV   IN VARCHAR2, -- 3169-DW1
               p_IDENT_CUSTO           IN Number, -- 3169-DW1
               p_VLR_BASE_INSS         IN Number, -- 3003
               p_VLR_ALIQ_INSS         IN Number, -- 3003
               p_VLR_INSS_RETIDO       IN Number, -- 3003
               P_COD_NAT_REC           IN NUMBER, -- 3169-DW11
               P_IND_NAT_BASE_CRED     IN Varchar2, -- 3169-GE13B
               P_VLR_ACRESCIMO         IN NUMBER,
               P_DSC_RESERVADO1        IN VARCHAR2, --3521
               P_DSC_RESERVADO2        IN VARCHAR2, --3521
               P_DSC_RESERVADO3        IN VARCHAR2, --3521
               P_IDENT_NBS             IN NUMBER, -- OS3924

               P_VLR_TOT_ADIC          IN NUMBER, -- OS4514
               P_VLR_TOT_RET           IN NUMBER, -- OS4514
               P_VLR_DEDUCAO_NF        IN NUMBER, -- OS4514
               P_VLR_RET_NF            IN NUMBER, -- OS4514
               P_VLR_RET_SERV          IN NUMBER, -- OS4514
               P_VLR_ALIQ_ISS_RETIDO   IN NUMBER, -- OS4226,
               P_COD_SIT_TRIB_ISS      IN VARCHAR2, -- OS4655
               P_VLR_N_RET_PRINC       IN NUMBER,
               P_VLR_N_RET_ADIC        IN NUMBER,
               P_VLR_DED_ALIM          IN NUMBER,
               P_VLR_DED_TRANS         IN NUMBER,
               P_IND_TP_PROC_ADJ_PRINC IN VARCHAR2, -- MFS10357
               P_IDENT_PROC_ADJ_PRINC  IN NUMBER,
               P_IDENT_SUSP_TBT_PRINC  IN NUMBER,
               P_IND_TP_PROC_ADJ_ADIC  IN VARCHAR2,
               P_IDENT_PROC_ADJ_ADIC   IN NUMBER,
               P_IDENT_SUSP_TBT_ADIC   IN NUMBER,
               P_VLR_SERV_15           IN NUMBER,
               P_VLR_SERV_20           IN NUMBER,
               P_VLR_SERV_25           IN NUMBER,
               P_VLR_ABAT_NTRIBUTADO   IN NUMBER, --MFS20985
               P_COD_ATIV_RJ           IN NUMBER, --MFS31367
               P_DSC_RESERVADO4        IN VARCHAR2,
               P_DSC_RESERVADO5        IN VARCHAR2,
               P_DSC_RESERVADO6        IN NUMBER,
               P_DSC_RESERVADO7        IN NUMBER,
               P_DSC_RESERVADO8        IN NUMBER

               ) Return Long;
               
Function X10(p_Cod_Empresa         IN Varchar2,
               p_Cod_Estab           IN VARCHAR2,
               p_Movto_e_s           IN VARCHAR2,
               p_Norm_Dev            IN VARCHAR2,
               p_Grupo_Contagem      IN VARCHAR2,
               p_Ident_Docto         IN NUMBER,
               p_Data_Movto          IN DATE,
               p_Num_Docto           IN VARCHAR2,
               p_Serie_Docfis        IN VARCHAR2,
               p_Sub_Serie_Docfis    IN VARCHAR2,
               p_Ident_Produto       IN NUMBER,
               p_Discri_Estoque      IN VARCHAR2,
               p_Num_Item            IN NUMBER,
               p_Ident_Und_Padrao    IN Number,
               p_Ident_Almox         IN NUMBER,
               p_Ident_Custo         IN NUMBER,
               p_Ident_Nat_Estoque   IN Number,
               p_Contrato            IN VARCHAR2,
               p_Serie_Item          IN VARCHAR2,
               p_Qtd_Movto           IN NUMBER,
               p_Preco_Unit          IN NUMBER,
               p_Preco_Item          IN NUMBER,
               p_Custo_Unit          IN NUMBER,
               p_Custo_Item          IN NUMBER,
               p_Ident_Conta_Cred    IN Number,
               p_Ident_Conta_Debito  IN Number,
               p_Ident_Operacao      IN NUMBER,
               p_Ident_Cfo           IN NUMBER,
               p_Cod_Ent_Saida       IN VARCHAR2,
               p_Vlr_Ipi             IN NUMBER,
               p_Data_Escrita_Fis    IN DATE,
               p_Obs_Estoque         IN VARCHAR2,
               p_Ident_Medida        IN NUMBER,
               p_Ident_Nbm           IN NUMBER,
               p_Num_Processo        IN NUMBER,
               p_Ind_Gravacao        IN VARCHAR2,
               p_Ind_Insumo          IN VARCHAR2,
               p_Ident_Legenda       IN NUMBER,
               p_Num_Ordem           IN VARCHAR2,
               p_Num_Docfis_Ofic     IN VARCHAR2,
               p_Serie_Docfis_Ofic   IN Varchar2,
               p_s_Serie_Docfis_Ofic IN Varchar2,
               p_Ident_Fis_Jur       IN NUMBER,
               p_Ind_Tp_Movto        IN VARCHAR2,
               p_Insc_Estadual       IN VARCHAR2,
               p_Ident_Prod_Rastro   IN Number,
               p_Num_Livro           IN NUMBER,
               p_Num_Folha           IN NUMBER,
               p_Vlr_Icms            IN NUMBER,
               p_Data_Disp           IN DATE,
               p_Ind_Doc_Oper        IN VARCHAR2,
               p_Ind_Tp_Doc_Interno  IN Varchar2,
               p_Ind_Redesignacao    IN VARCHAR2,
               p_Ident_Produto_Ori   IN Varchar2,
               P_VLR_CUSTO_DCA       IN NUMBER,
               P_VLR_OUT_TRIB_NCUMUL IN Number,
               P_COD_TP_LANCTO       IN VARCHAR2,
               P_VLR_ICMS_DCA        IN NUMBER,
               P_COD_DIF_PRODUCAO    IN VARCHAR2,
               P_DSC_FINALIDADE      IN VARCHAR2,
               P_COD_TIPO_MOV_EST    IN VARCHAR2,
               p_Ident_Medida_Ori    IN Number,
               P_COD_NIVEL_PRODUTO   IN Number,
               p_Qtd_Insumo          IN NUMBER,
               P_IND_CF              IN VARCHAR2
               )

   Return LONG;
               
Function X112(p_Cod_Empresa       IN Varchar2,
                p_Cod_Estab         IN VARCHAR2,
                p_Data_Fiscal       IN DATE,
                p_Movto_e_s         IN VARCHAR2,
                p_Norm_Dev          IN VARCHAR2,
                p_Ident_Docto       IN NUMBER,
                p_Ident_Fis_Jur     IN Number,
                p_Num_Docfis        IN VARCHAR2,
                p_Serie_Docfis      IN VARCHAR2,
                p_Sub_Serie_Docfis  IN Varchar2,
                p_Ident_Observacao  IN Number,
                p_Ind_Icompl_Lancto IN Varchar2,
                p_Dsc_Complementar  IN Varchar2,
                p_Vinculacao        IN VARCHAR2)


   Return LONG;

Function X113(p_Cod_Empresa      in Varchar2,
                p_Cod_Estab        IN VARCHAR2,
                p_Data_Fiscal      IN DATE,
                p_Movto_e_s        IN VARCHAR2,
                p_Norm_Dev         IN VARCHAR2,
                p_Ident_Docto      IN NUMBER,
                p_Ident_Fis_Jur    IN Number,
                p_Num_Docfis       IN VARCHAR2,
                p_Serie_Docfis     IN VARCHAR2,
                p_Sub_Serie_Docfis IN Varchar2,
                p_Ident_Observacao IN Number,
                p_Cod_Ajuste_Sped  IN Varchar2,
                p_Discri_Item      IN VARCHAR2,
                p_Dsc_Comp_Ajuste  IN Varchar2,
                p_Num_Item         IN NUMBER,
                p_Vlr_Base_Icms    IN Number,
                p_Aliquota_Icms    IN Number,
                p_Vlr_Icms         IN NUMBER,
                p_Vlr_Outros       IN NUMBER)

   Return LONG;
   
Function X116(p_Cod_Empresa          in Varchar2,
                p_Cod_Estab            in Varchar2,
                p_Data_Fiscal          in Date,
                p_Movto_e_s            IN VARCHAR2,
                p_Norm_Dev             IN VARCHAR2,
                p_Ident_Docto          in Number,
                p_Ident_Fis_Jur        in Number,
                p_Num_Docfis           in Varchar2,
                p_Serie_Docfis         in Varchar2,
                p_Sub_Serie_Docfis     in Varchar2,
                p_Ident_Observacao     in Number,
                p_Data_Fiscal_Ref      in Date,
                p_Movto_e_s_Ref        IN VARCHAR2,
                p_Ident_Fis_Jur_Ref    in Number,
                p_Num_Docfis_Ref       in Varchar2,
                p_Serie_Docfis_Ref     in Varchar2,
                p_Sub_Serie_Docfis_Ref in Varchar2,
                p_Ident_Modelo_Ref     in Number,
                p_num_autentic_nfe     in Varchar2)

   Return LONG;
   
FUNCTION X2013(pident_produto number,
              pgrupo_produto varchar2,
              pind_produto char,
              pcod_produto varchar2,
              pvalid_produto date,
              pdescricao varchar2,
              pident_nbm number,
              pind_regido_subst char,
              pind_controle_selo char,
              pnum_processo number,
              pind_gravacao char,
              pident_ncm number,
              pident_naladi number,
              pident_medida number,
              pident_grupo_prod number,
              pind_funrural char,
              pind_petr_energ char,
              pind_prd_incentiv char,
              pind_icms_diferido char,
              pcod_grp_incent varchar2,
              pcod_grupo_st varchar2,
              pident_conta number,
              pind_incid_icms_ser char,
              pident_und_padrao number,
              pvlr_peso_unit_kg number,
              pdescr_detalhada varchar2,
              pind_fabric_estab char,
              pfator_conversao number,
              pind_classif_icmss char,
              pdsc_modelo varchar2,
              porigem char,
              pident_grp_prod number,
              pind_incid_pis char,
              paliq_pis number,
              pind_incid_cofins char,
              paliq_cofins number,
              pcapac_volum number,
              pespecie_dnf number,
              pclas_item number,
              pcod_barras varchar2,
              pcod_anp number,
              pind_ant_prod char,
              pcod_ant_item varchar2,
              pdat_alt_codigo date,
              pclas_enquad_ipi varchar2,
              pmaterial_result_perda char,
              pdsc_finalidade varchar2,
              pqtd_cap_max_armaz number,
              pind_ativo_saics char,
              pind_tab_incidencia varchar2,
              pcod_grupo varchar2,
              pmarca_comercial varchar2,
              pind_carac_produto varchar2,
              pcod_cest varchar2,
              pvlr_reservado1 number,
              pvlr_reservado2 number,
              pvlr_reservado3 number,
              pdsc_reservado4 varchar2,
              pdsc_reservado5 varchar2,
              pdsc_reservado6 varchar2,
              pdsc_reservado7 varchar2,
              pdsc_reservado8 varchar2,
              pind_inc_ricms_pr VARCHAR2
              ) RETURN LONG;
   
  --FUNCTION para dar insert na safx07 baseado na linha do arquivo
  FUNCTION INSERT_LINE_SAFX07(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID;

  --FUNCTION para dar insert na safx08 baseado na linha do arquivo
  FUNCTION INSERT_LINE_SAFX08(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID;

  --FUNCTION para dar insert na safx09 baseado na linha do arquivo
  FUNCTION INSERT_LINE_SAFX09(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID;
  
  --FUNCTION para dar insert na safx10 baseado na linha do arquivo
  FUNCTION INSERT_LINE_SAFX10(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID;

  --FUNCTION para dar insert na safx112 baseado na linha do arquivo
  FUNCTION INSERT_LINE_SAFX112(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID;

  --FUNCTION para dar insert na safx113 baseado na linha do arquivo
  FUNCTION INSERT_LINE_SAFX113(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID;

    --FUNCTION para dar insert na safx116 baseado na linha do arquivo
  FUNCTION INSERT_LINE_SAFX116(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID;

    --FUNCTION para dar insert na safx118 baseado na linha do arquivo
  FUNCTION INSERT_LINE_SAFX118(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID;

    --FUNCTION para dar insert na safx2013 baseado na linha do arquivo
  FUNCTION INSERT_LINE_SAFX2013(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID;
  
END MSAF_EXPORTA_NOTA_CPROC;
/
CREATE OR REPLACE PACKAGE BODY MSAF_EXPORTA_NOTA_CPROC IS


  Erro_Leitura Exception;

  MSG_ERRO_W VARCHAR2(200);

  Linha_w Long;

  Tab Varchar2(20) := chr(9);

  /* DECLARACAO DE TIPOS */
  Type Tp_Trib_Base Is Record(
    Vlr_Aliq_Icms     Safx07.Vlr_Aliq_Icms%Type,
    Vlr_Icms          Safx07.Vlr_Icms%Type,
    Dif_Aliq_Icms     Safx07.Dif_Aliq_Icms%Type,
    Obs_Icms          Safx07.Obs_Icms%Type,
    Cod_Apur_Icms     Safx07.Cod_Apur_Icms%Type,
    Vlr_Aliq_Ipi      Safx07.Vlr_Aliq_Ipi%Type,
    Vlr_Ipi           Safx07.Vlr_Ipi%Type,
    Obs_Ipi           Safx07.Obs_Ipi%Type,
    Cod_Apur_Ipi      Safx07.Cod_Apur_Ipi%Type,
    Vlr_Aliq_Ir       Safx07.Vlr_Aliq_Ir%Type,
    Vlr_Ir            Safx07.Vlr_Ir%Type,
    Vlr_Aliq_Iss      Safx07.Vlr_Aliq_Iss%Type,
    Vlr_Iss           Safx07.Vlr_Iss%Type,
    Vlr_Aliq_Sub_Icms Safx07.Vlr_Aliq_Sub_Icms%Type,
    Vlr_Subst_Icms    Safx07.Vlr_Subst_Icms%Type,
    Obs_Subst_Icms    Safx07.Obs_Subst_Icms%Type,
    Cod_Apur_Sub_Icms Safx07.Cod_Apur_Sub_Icms%Type,
    Ind_Cred_Icmss    Safx07.Ind_Cred_Icmss%Type,
    Base_Trib_Icms    Safx07.Base_Trib_Icms%Type,
    Base_Isen_Icms    Safx07.Base_Isen_Icms%Type,
    Base_Outr_Icms    Safx07.Base_Outr_Icms%Type,
    Base_Redu_Icms    Safx07.Base_Redu_Icms%Type,

    Vlr_Base_Ise_Icmss Safx07.Vlr_Base_Ise_Icmss%Type,
    Vlr_Base_Out_Icmss Safx07.Vlr_Base_Out_Icmss%Type,
    Vlr_Red_Base_Icmss Safx07.Vlr_Red_Base_Icmss%Type,

    Base_Sub_Trib_Icms Safx07.Base_Sub_Trib_Icms%Type,
    Base_Trib_Ipi      Safx07.Base_Trib_Ipi%Type,
    Base_Isen_Ipi      Safx07.Base_Isen_Ipi%Type,
    Base_Outr_Ipi      Safx07.Base_Outr_Ipi%Type,
    Base_Redu_Ipi      Safx07.Base_Redu_Ipi%Type,
    Base_Trib_Ir       Safx07.Base_Trib_Ir%Type,
    Base_Isen_Ir       Safx07.Base_Isen_Ir%Type,
    Base_Trib_Iss      Safx07.Base_Trib_Iss%Type,
    Base_Isen_Iss      Safx07.Base_Isen_Iss%Type,
    Base_Real_Terc_Iss Safx07.Base_Real_Terc_Iss%Type,
    IND_IPI_NDESTAC_DF Safx07.IND_IPI_NDESTAC_DF%Type);

  /* VARIAVEIS DE TRABALHO */
  Saf                         Tp_Trib_Base;
  Cod_Docto_w                 Safx07.Cod_Docto%Type;
  Cod_Fis_Jur_w               Safx07.Cod_Fis_Jur%Type;
  Ind_Fis_Jur_w               Safx07.Ident_Fis_Jur%Type;
  Cod_Modelo_w                Safx07.Cod_Modelo%Type;
  Cod_Cfo_w                   Safx07.Cod_Cfo%Type;
  Cod_Natureza_Op_w           Safx07.Cod_Natureza_Op%Type;
  Cod_Conta_w                 Safx07.Cod_Conta%Type;
  Cod_Estado_w                Safx07.Uf_Orig_Dest%Type;
  Num_Maquina_w               X07_Cupom_Fiscal.Num_Maquina%Type;
  Num_Cupom_w                 X07_Cupom_Fiscal.Num_Cupom_Final%Type;
  Num_Cont_Reduc_w            X07_Cupom_Fiscal.Num_Cont_Reduc%Type;
  Cod_Quitacao_w              Safx07.Cod_Quitacao%Type;
  Cod_Observacao_w            Safx07.Cod_Observacao%Type;
  Cod_Situacao_a_w            Safx07.Cod_Situacao_a%Type;
  Cod_Situacao_b_w            Safx07.Cod_Situacao_b%Type;
  Cod_Classe_Consumo_w        Safx07.Cod_Classe_Consumo%Type;
  Cod_Classe_Consumo_sef_pe_w Safx07.Cod_Classe_Consumo%Type;
  Uf_Consumo_w                Safx07.Uf_Consumo%Type;
  cod_scp_w                   safx07.cod_scp%type;

  Cod_Oper_Esp_St_w Safx07.Cod_Oper_Esp_St%Type;
  
PROCEDURE PROC_LINHA (
    P_LINHA  IN OUT	LONG,
    P_CAMPO	 IN OUT	VARCHAR2,
    P_EDATA	 IN	    VARCHAR2 := 'N',
    P_EDESCR IN	    VARCHAR2 := 'S',
    P_EESP   IN     VARCHAR2 := 'N') IS
  -- Variável para armazenar o primeiro TAB na linha passada como parâmetro
  POS_W NUMBER;

  PROCEDURE ATRIBUI_CAMPO ( P_VALOR IN VARCHAR2 ) IS
    POS_X NUMBER;
    BEGIN
      POS_X := INSTR( P_VALOR, CHR(13));
      IF POS_X > 0 THEN
        P_CAMPO := SUBSTR(P_VALOR,1,POS_X-1);
      ELSE
        P_CAMPO := P_VALOR;
      END IF;
    END ATRIBUI_CAMPO;

BEGIN
    IF TRIM(P_LINHA) IS NULL THEN -- Verifica se linha está vazia
        P_CAMPO := NULL;
    ELSE
--        POS_W := INSTR(P_LINHA,'	'); -- Procura pelo primeiro TAB na linha
        POS_W := INSTR(P_LINHA,chr(9)); -- Procura pelo primeiro TAB na linha
        IF POS_W < 1 THEN -- Verifica se é o último campo da tabela
            ATRIBUI_CAMPO ( P_LINHA );
            P_LINHA := '';
        ELSIF POS_W = 1 THEN -- Verifica se o campo possue somente TAB
            P_CAMPO := NULL;
            P_LINHA := SUBSTR(P_LINHA,2);
        ELSE -- Para os demais casos
		        ATRIBUI_CAMPO ( SUBSTR(P_LINHA,1,POS_W - 1));
            P_LINHA := SUBSTR(P_LINHA,LENGTH(P_CAMPO) + 2);
        END IF;
    END IF;
    -- Verificar se o valor atribuído para o campo deve ser nulo
    IF (P_EESP = 'N'
       AND (NVL(INSTR(LTRIM(RTRIM(P_CAMPO)),'@'),0) <> 0))
    OR (P_EESP = 'S'
       AND (Verifica_atrib_anula(P_CAMPO)) = 1)
    OR ( P_EDESCR <> 'S' AND LTRIM(P_CAMPO) IS NULL )
    OR ( P_EDATA = 'S' AND P_CAMPO = '00000000' )
    OR ( RTRIM(LTRIM(P_CAMPO)) IS NULL ) THEN
        P_CAMPO := NULL;
    ELSE
        P_CAMPO := RTRIM(LTRIM(P_CAMPO));
    END IF;
END PROC_LINHA;

  PROCEDURE PROC_TRIM(P_LINHA  IN OUT LONG,
                             P_CAMPO  IN OUT VARCHAR2,
                             P_EDATA  IN VARCHAR2 := 'N',
                             P_EDESCR IN VARCHAR2 := 'S') IS
    -- Variável para armazenar o primeiro TAB na linha passada como parâmetro
    POS_W integer;

    PROCEDURE ATRIBUI_CAMPO(P_VALOR IN VARCHAR2) IS
      POS_X INTEGER;
    BEGIN
      POS_X := INSTR(P_VALOR, CHR(13));
      IF POS_X > 0 THEN
        P_CAMPO := SUBSTR(P_VALOR, 1, POS_X - 1);
      ELSE
        P_CAMPO := P_VALOR;
      END IF;
    END ATRIBUI_CAMPO;

  BEGIN
    --LTRIM(P_LINHA)='' OR
    IF LTRIM(P_LINHA) IS NULL THEN
      -- Verifica se linha está vazia
      P_CAMPO := NULL;
    ELSE
      POS_W := INSTR(P_LINHA, CHR(9)); -- Procura pelo primeiro TAB na linha *colocação do CHR(9) referente ao chamado 31069
      IF POS_W < 1 THEN
        -- Verifica se é o último campo da tabela
        ATRIBUI_CAMPO(P_LINHA);
        P_LINHA := '';
      ELSIF POS_W = 1 THEN
        -- Verifica se o campo possue somente TAB
        P_CAMPO := NULL;
        P_LINHA := SUBSTR(P_LINHA, 2);
      ELSE
        -- Para os demais casos
        ATRIBUI_CAMPO(SUBSTR(P_LINHA, 1, POS_W - 1));
        P_LINHA := SUBSTR(P_LINHA, LENGTH(P_CAMPO) + 2);
      END IF;
    END IF;
    -- Verificar se o valor atribuído para o campo deve ser nulo
    IF INSTR(P_CAMPO, '@') <> 0 OR (P_EDESCR <> 'S' AND P_CAMPO IS NULL) OR
       (P_EDATA = 'S' AND P_CAMPO = '00000000') THEN
      P_CAMPO := NULL;
    END IF;
  END PROC_TRIM;

  Procedure Rec_Trib_Base(p_Sub_Serie     In Varchar2,
                          p_Serie         In Varchar2,
                          p_Numdoc        In Varchar2,
                          p_Ident_Fis_Jur In Number,
                          p_Ident_Docto   In Number,
                          p_Norm_Dev      IN VARCHAR2,
                          p_Movto_e_s     IN VARCHAR2,
                          p_Data_Fiscal   In Date,
                          p_Cod_Estab     In Varchar2,
                          p_Cod_Empresa   In Varchar2) Is

    Rnulo           Tp_Trib_Base;
    Cod_Oper_Apur_w Detalhe_Operacao.Cod_Oper_Apur%Type;
    Chave_w         Log_Det_Proc.Mens_Erro%Type;
    Cod_Erro_w      Log_Det_Proc.Cod_Erro%Type;
    Erro_Leitura Exception;
    Msg_Erro_w Varchar2(200);

  Begin
    Saf     := Rnulo;
    Chave_w := p_Cod_Empresa || ' - ' || p_Cod_Estab || ' - ' ||
               p_Data_Fiscal || ' - ' || p_Movto_e_s || ' - ' || p_Norm_Dev ||
               ' - ' || p_Ident_Docto || ' - ' || p_Ident_Fis_Jur || ' - ' ||
               p_Numdoc || ' - ' || p_Serie || ' - ' || p_Sub_Serie;

    /* ----------------- RECUPERA TRIBUTOS -------------------------- */
    For Rt In (Select *
                 From X07_Trib_Docfis
                Where Sub_Serie_Docfis = p_Sub_Serie
                  And Serie_Docfis = p_Serie
                  And Num_Docfis = p_Numdoc
                  And Ident_Fis_Jur = p_Ident_Fis_Jur
                  And Ident_Docto = p_Ident_Docto
                  And Norm_Dev = p_Norm_Dev
                  And Movto_e_s = p_Movto_e_s
                  And Data_Fiscal = p_Data_Fiscal
                  And Cod_Estab = p_Cod_Estab
                  And Cod_Empresa = p_Cod_Empresa) Loop
      Begin
        Cod_Oper_Apur_w := Null;
        If Rt.Ident_Det_Operacao Is Not Null Then
          Begin
            Select Cod_Det_Operacao
              Into Cod_Oper_Apur_w
              From Detalhe_Operacao
             Where Ident_Det_Operacao = Rt.Ident_Det_Operacao;
          Exception
            When No_Data_Found Then
              Cod_Oper_Apur_w := Null;
          End;
        End If;

        If Rt.Cod_Tributo = 'ICMS' Then
          If Rt.Aliq_Tributo Is Not Null Then
            Saf.Vlr_Aliq_Icms := Lpad(To_Char(Rt.Aliq_Tributo * 10000),
                                      7,
                                      '0');
          End If;
          If Rt.Vlr_Tributo Is Not Null Then
            Saf.Vlr_Icms := Lpad(To_Char(Rt.Vlr_Tributo * 100), 17, '0');
          End If;
          If Rt.Dif_Aliq_Tributo Is Not Null Then
            Saf.Dif_Aliq_Icms := Lpad(To_Char(Rt.Dif_Aliq_Tributo * 10000),
                                      7,
                                      '0');
          End If;
          Saf.Obs_Icms      := Rpad(Ltrim(Rt.Obs_Tributo), 45, ' ');
          Saf.Cod_Apur_Icms := Rpad(Ltrim(Cod_Oper_Apur_w), 5, ' ');
        Elsif Rt.Cod_Tributo = 'ICMS-S' Then
          If Rt.Aliq_Tributo Is Not Null Then
            Saf.Vlr_Aliq_Sub_Icms := Lpad(To_Char(Rt.Aliq_Tributo * 10000),
                                          7,
                                          '0');
          End If;
          If Rt.Vlr_Tributo Is Not Null Then
            Saf.Vlr_Subst_Icms := Lpad(To_Char(Rt.Vlr_Tributo * 100),
                                       17,
                                       '0');
          End If;
          Saf.Obs_Subst_Icms    := Rpad(Ltrim(Rt.Obs_Tributo), 45, ' ');
          Saf.Cod_Apur_Sub_Icms := Rpad(Ltrim(Cod_Oper_Apur_w), 5, ' ');
          Saf.Ind_Cred_Icmss    := Rt.Ind_Cred_Tributo;
        Elsif Rt.Cod_Tributo = 'IPI' Then
          If Rt.Aliq_Tributo Is Not Null Then
            Saf.Vlr_Aliq_Ipi := Lpad(To_Char(Rt.Aliq_Tributo * 10000),
                                     7,
                                     '0');
          End If;
          If Rt.Vlr_Tributo Is Not Null Then
            Saf.Vlr_Ipi := Lpad(To_Char(Rt.Vlr_Tributo * 100), 17, '0');
          End If;
          Saf.Obs_Ipi            := Rpad(Ltrim(Rt.Obs_Tributo), 45, ' ');
          Saf.Cod_Apur_Ipi       := Rpad(Ltrim(Cod_Oper_Apur_w), 5, ' ');
          Saf.IND_IPI_NDESTAC_DF := Rt.IND_IPI_NDESTAC_DF;
        Elsif Rt.Cod_Tributo = 'IR' Then
          If Rt.Aliq_Tributo Is Not Null Then
            Saf.Vlr_Aliq_Ir := Lpad(To_Char(Rt.Aliq_Tributo * 10000),
                                    7,
                                    '0');
          End If;
          If Rt.Vlr_Tributo Is Not Null Then
            Saf.Vlr_Ir := Lpad(To_Char(Rt.Vlr_Tributo * 100), 17, '0');
          End If;
        Elsif Rt.Cod_Tributo = 'ISS' Then
          If Rt.Aliq_Tributo Is Not Null Then
            Saf.Vlr_Aliq_Iss := Lpad(To_Char(Rt.Aliq_Tributo * 10000),
                                     7,
                                     '0');
          End If;
          If Rt.Vlr_Tributo Is Not Null Then
            Saf.Vlr_Iss := Lpad(To_Char(Rt.Vlr_Tributo * 100), 17, '0');
          End If;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60109;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    End Loop; -- FIM LOOP TRIBUTOS

    /* ----------------------  RECUPERA BASES ---------------------------- */
    For Rb In (Select *
                 From X07_Base_Docfis
                Where Sub_Serie_Docfis = p_Sub_Serie
                  And Serie_Docfis = p_Serie
                  And Num_Docfis = p_Numdoc
                  And Ident_Fis_Jur = p_Ident_Fis_Jur
                  And Ident_Docto = p_Ident_Docto
                  And Norm_Dev = p_Norm_Dev
                  And Movto_e_s = p_Movto_e_s
                  And Data_Fiscal = p_Data_Fiscal
                  And Cod_Estab = p_Cod_Estab
                  And Cod_Empresa = p_Cod_Empresa) Loop
      Begin
        If Rb.Vlr_Base Is Not Null Then
          If Rb.Cod_Tributo = 'ICMS' Then
            If Rb.Cod_Tributacao = 1 Then
              Saf.Base_Trib_Icms := Lpad(To_Char(Rb.Vlr_Base * 100),
                                         17,
                                         '0');
            Elsif Rb.Cod_Tributacao = 2 Then
              Saf.Base_Isen_Icms := Lpad(To_Char(Rb.Vlr_Base * 100),
                                         17,
                                         '0');
            Elsif Rb.Cod_Tributacao = 3 Then
              Saf.Base_Outr_Icms := Lpad(To_Char(Rb.Vlr_Base * 100),
                                         17,
                                         '0');
            Elsif Rb.Cod_Tributacao = 4 Then
              Saf.Base_Redu_Icms := Lpad(To_Char(Rb.Vlr_Base * 100),
                                         17,
                                         '0');
            End If;

          Elsif Rb.Cod_Tributo = 'ICMS-S' Then
            If Rb.Cod_Tributacao = 1 Then
              Saf.Base_Sub_Trib_Icms := Lpad(To_Char(Rb.Vlr_Base * 100),
                                             17,
                                             '0');
            Elsif Rb.Cod_Tributacao = 2 Then
              Saf.Vlr_Base_Ise_Icmss := Lpad(To_Char(Rb.Vlr_Base * 100),
                                             17,
                                             '0');
            Elsif Rb.Cod_Tributacao = 3 Then
              Saf.Vlr_Base_Out_Icmss := Lpad(To_Char(Rb.Vlr_Base * 100),
                                             17,
                                             '0');
            Elsif Rb.Cod_Tributacao = 4 Then
              Saf.Vlr_Red_Base_Icmss := Lpad(To_Char(Rb.Vlr_Base * 100),
                                             17,
                                             '0');
            End If;

          Elsif Rb.Cod_Tributo = 'IPI' Then
            If Rb.Cod_Tributacao = 1 Then
              Saf.Base_Trib_Ipi := Lpad(To_Char(Rb.Vlr_Base * 100), 17, '0');
            Elsif Rb.Cod_Tributacao = 2 Then
              Saf.Base_Isen_Ipi := Lpad(To_Char(Rb.Vlr_Base * 100), 17, '0');
            Elsif Rb.Cod_Tributacao = 3 Then
              Saf.Base_Outr_Ipi := Lpad(To_Char(Rb.Vlr_Base * 100), 17, '0');
            Elsif Rb.Cod_Tributacao = 4 Then
              Saf.Base_Redu_Ipi := Lpad(To_Char(Rb.Vlr_Base * 100), 17, '0');
            End If;

          Elsif Rb.Cod_Tributo = 'IR' Then
            If Rb.Cod_Tributacao = 1 Then
              Saf.Base_Trib_Ir := Lpad(To_Char(Rb.Vlr_Base * 100), 17, '0');
            Elsif Rb.Cod_Tributacao = 2 Then
              Saf.Base_Isen_Ir := Lpad(To_Char(Rb.Vlr_Base * 100), 17, '0');
            End If;
          Elsif Rb.Cod_Tributo = 'ISS' Then
            If Rb.Cod_Tributacao = 1 Then
              Saf.Base_Trib_Iss := Lpad(To_Char(Rb.Vlr_Base * 100), 17, '0');
            Elsif Rb.Cod_Tributacao = 2 Then
              Saf.Base_Isen_Iss := Lpad(To_Char(Rb.Vlr_Base * 100), 17, '0');
            Elsif Rb.Cod_Tributacao = 3 Then
              Saf.Base_Real_Terc_Iss := Lpad(To_Char(Rb.Vlr_Base * 100),
                                             17,
                                             '0');
            End If;
          End If;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60110;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    End Loop; -- FIM LOOP BASES
  End Rec_Trib_Base;

  Function X07(p_Cod_Empresa                 in Varchar2,
               p_Cod_Estab                   in Varchar2,
               p_Data_Fiscal                 in DATE,
               p_Movto_e_s                   in Varchar2,
               p_Norm_Dev                    in Varchar2,
               p_Ident_Docto                 in Number,
               p_Ident_Fis_Jur               in Number,
               p_Num_Docfis                  in Varchar2,
               p_Serie_Docfis                in Varchar2,
               p_Sub_Serie_Docfis            in Varchar2,
               p_Data_Emissao                in DATE,
               p_Cod_Class_Doc_Fis           in Varchar2,
               p_Ident_Modelo                in Number,
               p_Ident_Cfo                   in Number,
               p_Ident_Natureza_Op           in Number,
               p_Num_Docfis_Ref              in Varchar2,
               p_Serie_Docfis_Ref            in Varchar2,
               p_s_Ser_Docfis_Ref            in Varchar2,
               p_Num_Dec_Imp_Ref             in Varchar2,
               p_Data_Saida_Rec              in DATE,
               p_Insc_Estad_Substit          in Varchar2,
               p_Vlr_Produto                 in Number,
               p_Vlr_Tot_Nota                in Number,
               p_Vlr_Frete                   in Number,
               p_Vlr_Seguro                  in Number,
               p_Vlr_Outras                  in Number,
               p_Vlr_Base_Dif_Frete          in Number,
               p_Vlr_Desconto                in Number,
               p_Contrib_Final               in Varchar2,
               p_Situacao                    in Varchar2,
               p_Cod_Indice                  in Varchar2,
               p_Vlr_Nota_Conv               in Number,
               p_Ident_Conta                 in Number,
               p_Ind_Modelo_Cupom            in Varchar2,
               p_Num_Processo                in Number,
               p_Ind_Gravacao                IN VARCHAR2,
               p_Vlr_Contab_Compl            in Number,
               p_Num_Controle_Docto          in Varchar2,
               p_Vlr_Aliq_Destino            in Number,
               p_Vlr_Outros1                 in Number,
               p_Vlr_Outros2                 in Number,
               p_Vlr_Outros3                 in Number,
               p_Vlr_Outros4                 in Number,
               p_Vlr_Outros5                 in Number,
               p_Vlr_Aliq_Outros1            in Number,
               p_Vlr_Aliq_Outros2            in Number,
               p_Ind_Nf_Especial             IN VARCHAR2,
               p_Ind_Tp_Frete                IN VARCHAR2,
               p_Cod_Municipio               in Number,
               p_Ind_Transf_Cred             IN VARCHAR2,
               p_Dat_Di                      IN DATE,
               p_Vlr_Tom_Servico             in Number,
               p_Dat_Escr_Extemp             IN DATE,
               p_Cod_Trib_Int                in Number,
               p_Cod_Regiao                  in Number,
               p_Dat_Autentic                IN DATE,
               p_Cod_Canal_Distrib           in Varchar2,
               p_Vlr_Icms_Ndestac            in Number,
               p_Vlr_Ipi_Ndestac             in Number,
               p_Vlr_Base_Inss               in Number,
               p_Vlr_Aliq_Inss               in Number,
               p_Vlr_Inss_Retido             in Number,
               p_Vlr_Mat_Aplic_Iss           in Number,
               p_Vlr_Subempr_Iss             in Number,
               p_Ind_Munic_Iss               IN VARCHAR2,
               p_Ind_Classe_Op_Iss           IN VARCHAR2,
               p_Dat_Fato_Gerador            IN DATE,
               p_Dat_Cancelamento            IN DATE,
               p_Num_Pagina                  in Varchar2,
               p_Num_Livro                   in Varchar2,
               p_Nro_Aidf_Nf                 in Varchar2,
               p_Dat_Valid_Doc_Aidf          IN DATE,
               p_Ind_Fatura                  IN VARCHAR2,
               p_Ident_Quitacao              in Number,
               p_Num_Selo_Cont_Icms          in Varchar2,
               p_Vlr_Base_Pis                in Number,
               p_Vlr_Pis                     in Number,
               p_Vlr_Base_Cofins             in Number,
               p_Vlr_Cofins                  in Number,
               p_Base_Icms_Origdest          in Number,
               p_Vlr_Icms_Origdest           in Number,
               p_Aliq_Icms_Origdest          in Number,
               p_Vlr_Desc_Condic             in Number,
               p_Perc_Red_Base_Icms          in Number,
               p_Ident_Fisjur_Cpdir          in Number,
               p_Ind_Medidajudicial          IN VARCHAR2,
               p_Ident_Uf_Orig_Dest          in Number,
               p_Ind_Compra_Venda            in Varchar2,
               p_Cod_Tp_Disp_Seg             in Varchar2,
               p_Num_Ctr_Disp                in Number,
               p_Num_Fim_Docto               in Varchar2,
               p_Ident_Uf_Destino            in Number,
               p_Serie_Ctr_Disp              in Varchar2,
               p_Sub_Serie_Ctr_Disp          in Varchar2,
               p_Ind_Situacao_Esp            IN VARCHAR2,
               p_Insc_Estadual               in Varchar2,
               p_Cod_Pagto_Inss              in Varchar2,
               p_Dat_Operacao                IN DATE,
               p_Usuario                     in Varchar2,
               p_Dat_Intern_Am               IN DATE,
               p_Ident_Fisjur_Lsg            in Number,
               p_Comprov_Exp                 in Varchar2,
               p_Num_Final_Crt_Disp          in Number,
               p_Num_Alvara                  in Varchar2,
               p_Notifica_Sefaz              in Varchar2,
               p_Interna_Suframa             in Varchar2,
               p_Cod_Amparo                  in Varchar2,
               p_Ident_Estado_Ampar          in Number,
               p_Ind_Nota_Servico            IN VARCHAR2,
               p_Cod_Motivo                  in Varchar2,
               p_Obs_Compl_Motivo            in Varchar2,
               p_Ind_Tp_Ret                  IN VARCHAR2,
               p_Ind_Tp_Tomador              IN VARCHAR2,
               p_Cod_Antec_St                in Varchar2,
               p_Cnpj_Armaz_Orig             in Varchar2,
               p_Ident_Uf_Armaz_Orig         in Number,
               p_Ins_Est_Armaz_Orig          in Varchar2,
               p_Cnpj_Armaz_Dest             in Varchar2,
               p_Ident_Uf_Armaz_Dest         in Number,
               p_Ins_Est_Armaz_Dest          in Varchar2,
               p_Obs_Inf_Adic_Nf             in Varchar2,
               p_Vlr_Base_Inss_2             in Number,
               p_Vlr_Aliq_Inss_2             in Number,
               p_Vlr_Inss_Retido_2           in Number,
               p_Cod_Pagto_Inss_2            in Varchar2,
               p_Vlr_Base_Pis_St             in Number,
               p_Vlr_Aliq_Pis_St             in Number,
               p_Vlr_Pis_St                  in Number,
               p_Vlr_Base_Cofins_St          in Number,
               p_Vlr_Aliq_Cofins_St          in Number,
               p_Vlr_Cofins_St               in Number,
               p_Vlr_Base_Csll               in Number,
               p_Vlr_Aliq_Csll               in Number,
               p_Vlr_Csll                    in Number,
               p_Vlr_Aliq_Pis                in Number,
               p_Vlr_Aliq_Cofins             in Number,
               p_Base_Icmss_Substituido      in Number,
               p_Vlr_Icmss_Substituido       in Number,
               p_Ind_Situacao_Esp_St         IN VARCHAR2,
               p_Vlr_Icmss_Ndestac           in Number,
               p_Ind_Docto_Rec               IN VARCHAR2,
               p_Dat_Pgto_Gnre_Darj          IN DATE,
               p_Cod_Cei                     in Varchar2,
               p_Vlr_Juros_Inss              in Number,
               p_Vlr_Multa_Inss              in Number,
               p_Dt_Pagto_Nf                 IN DATE,
               p_Ind_Origem_Info             IN VARCHAR2,
               p_Hora_Saida                  in Number,
               p_Cod_Sit_Docfis              in Varchar2,
               p_Ident_Observacao            in Number,
               p_Ident_Situacao_a            in Number,
               p_Ident_Situacao_b            in Number,
               p_Num_Ciclo                   in Varchar2,
               p_Cod_Municipio_Orig          in Number,
               p_Cod_Municipio_Dest          in Number,
               p_Cod_Cfps                    in Varchar2,
               p_Num_Lancamento              in Varchar2,
               p_Vlr_Mat_Prop                in Number,
               p_Vlr_Mat_Terc                in Number,
               p_Vlr_Base_Iss_Retido         in Number,
               p_Vlr_Iss_Retido              in Number,
               p_Vlr_Deducao_Iss             in Number,
               p_Cod_Munic_Armaz_Orig        in Number,
               p_Ins_Munic_Armaz_Orig        in Varchar2,
               p_Cod_Munic_Armaz_Dest        in Number,
               p_Ins_Munic_Armaz_Dest        in Varchar2,
               p_Ident_Classe_Consumo        in Number,
               p_Ind_Especif_Receita         IN VARCHAR2,
               p_Num_Contrato                in Varchar2,
               p_Cod_Area_Terminal           in Varchar2,
               p_Cod_Tp_Util                 in Varchar2,
               p_Grupo_Tensao                in Varchar2,
               p_Data_Consumo_Ini            in DATE,
               p_Data_Consumo_Fim            in DATE,
               p_Data_Consumo_Leit           IN DATE,
               p_Qtd_Contratada_Ponta        in Number,
               p_Qtd_Contratada_Fponta       in Number,
               p_Qtd_Consumo_Total           in Number,
               p_Ident_Uf_Consumo            in Number,
               p_Cod_Munic_Consumo           in Number,
               p_Cod_Oper_Esp_St             in Varchar2,
               p_Ato_Normativo               in Varchar2,
               p_Num_Ato_Normativo           in Number,
               p_Ano_Ato_Normativo           in Number,
               p_Capitulacao_Norma           in Varchar2,
               p_Vlr_Outras_Entid            in Number,
               p_Vlr_Terceiros               in Number,
               p_Ind_Tp_Compl_Icms           in Varchar2,
               p_Vlr_Base_Cide               in Varchar2,
               p_Vlr_Aliq_Cide               in Varchar2,
               p_Vlr_Cide                    in Varchar2,
               p_Cod_Verific_Nfe             in Varchar2, -- OS2286
               p_Cod_Tp_Rps_Nfe              in Varchar2, -- OS2286
               p_Num_Rps_Nfe                 in Number, -- OS2286
               p_Serie_Rps_Nfe               in Varchar2, -- OS2286
               p_Dat_Emissao_Rps_Nfe         in DATE, -- OS2286
               p_Dsc_Servico_Nfe             in Varchar2, -- OS2286
               p_Num_Autentic_Nfe            in Varchar2, -- OS2295
               p_Num_Dv_Nfe                  IN VARCHAR2, -- CH33683
               p_Modelo_Nf_Dms               in Varchar2, -- OS 2313
               p_Cod_Modelo_Cotepe           in Varchar2, -- OS2354
               p_Vlr_Comissao                in Varchar2, -- OS2403
               p_Ind_Nfe_Deneg_Inut          In Number, -- OS2388-B
               p_Ind_Nf_Reg_Especial         In Varchar2, -- OS2388-B
               p_Vlr_Abat_Ntributado         In Number, -- OS2388-B
               p_Vlr_Outros_Icms             In Number,
               p_Hora_Emissao                in Number, -- OS2466-A
               p_Obs_Dados_Fatura            in Varchar2, -- OS2466-A
               p_Ident_Fis_Conces            in Number, -- OS2388-Pdw
               p_Cod_Autentic                in Varchar2,
               p_Ind_Port_Cat44              IN VARCHAR2,
               p_VLR_BASE_INSS_RURAL         in Varchar2, --OS2388-B2
               p_VLR_ALIQ_INSS_RURAL         in Varchar2, --OS2388-B2
               p_VLR_INSS_RURAL              in Varchar2,
               p_Ident_Classe_Consumo_sef_pe in Number, --OS2388-B2
               P_VLR_PIS_RETIDO              IN NUMBER, -- 3169-DW1
               P_VLR_COFINS_RETIDO           IN NUMBER, -- 3169-DW1
               P_DAT_LANC_PIS_COFINS         IN DATE, -- 3169-DW1
               P_IND_PIS_COFINS_EXTEMP       IN VARCHAR2, -- 3169-DW1
               P_COD_SIT_PIS                 IN NUMBER, -- 3169-DW1
               P_COD_SIT_COFINS              IN NUMBER, -- 3169-DW1
               P_IND_NAT_FRETE               IN VARCHAR2,
               P_COD_NAT_REC                 IN NUMBER,
               P_IND_VENDA_CANC              IN VARCHAR2, -- 3169-GE13
               P_IND_NAT_BASE_CRED           IN Varchar2, --3169-GE13B
               P_IND_NF_CONTINGENCIA         IN Varchar2,
               P_VLR_ACRESCIMO               IN NUMBER,
               P_VLR_ANTECIP_TRIB            IN NUMBER,
               P_DSC_RESERVADO1              IN VARCHAR2, --3521
               P_DSC_RESERVADO2              IN VARCHAR2, --3521
               P_DSC_RESERVADO3              IN VARCHAR2, --3521
               P_NUM_NFTS                    IN VARCHAR2,
               P_IND_NF_VENDA_TERCEIROS      IN VARCHAR2,
               P_DSC_RESERVADO4              IN VARCHAR2, --3749
               P_DSC_RESERVADO5              IN VARCHAR2, --3749
               P_DSC_RESERVADO6              IN NUmber, --3749
               P_DSC_RESERVADO7              IN Number, --3749
               P_DSC_RESERVADO8              IN Number, --3749
               P_IDENTIF_DOCFIS              IN VARCHAR2, --3743
               P_COD_SISTEMA_ORIG            IN VARCHAR2, --3743
               P_IDENT_SCP                   IN NUMBER, --OS4316

               P_IND_PREST_SERV  IN VARCHAR2, -- OS 4514
               P_IND_TIPO_PROC   IN VARCHAR2, -- OS 4514
               P_NUM_PROC_JUR    IN VARCHAR2, -- OS 4514
               P_IND_DEC_PROC    IN VARCHAR2, -- OS 4514
               P_IND_TIPO_AQUIS  IN VARCHAR2, -- OS 4514
               P_VLR_DESC_GILRAT IN NUMBER, -- OS 4514
               P_VLR_DESC_SENAR  IN NUMBER, -- OS 4514

               P_CNPJ_SUBEMPREITEIRO       IN VARCHAR2,
               P_CNPJ_CPF_PROPRIETARIO_CNO IN VARCHAR2,
               P_VLR_RET_SUBEMPREITADO     IN NUMBER,

               P_NUM_DOCFIS_SERV IN VARCHAR2 --OS 3341

              ,
               P_VLR_FCP_UF_DEST  IN NUMBER -- MFS2101
              ,
               P_VLR_ICMS_UF_DEST IN NUMBER -- MFS2101
              ,
               P_VLR_ICMS_UF_ORIG IN NUMBER -- MFS2101

              ,
               P_VLR_CONTRIB_PREV        IN NUMBER --MFS2967
              ,
               P_VLR_GILRAT              IN NUMBER --MFS2967
              ,
               P_VLR_CONTRIB_SENAR       IN NUMBER --OS2967
              ,
               P_CPF_CNPJ                IN VARCHAR2 --MFS11800
              ,
               P_NUM_CERTIF_QUAL         IN VARCHAR2 --MFS13120
              ,
               P_OBS_REINF               IN VARCHAR2 --MFS14129
              ,
               P_VLR_TOT_ADIC            IN NUMBER,
               P_VLR_RET_SERV            IN NUMBER,
               P_VLR_SERV_15             IN NUMBER,
               P_VLR_SERV_20             IN NUMBER,
               P_VLR_SERV_25             IN NUMBER,
               P_VLR_IPI_DEV             IN NUMBER --MFS20985
              ,
               P_VLR_SEST                IN NUMBER,
               P_VLR_SENAT               IN NUMBER,
               P_IND_FIN_EMISSAO_NFE     IN VARCHAR2,
               P_NUM_AUTENTIC_NFE_SUBST  IN VARCHAR2,
               P_IND_VLR_ICMS_COB_ANT_ST IN VARCHAR2) Return Long Is

    LINHA_W LONG;

    Cod_Oper_Apur_w Detalhe_Operacao.Cod_Oper_Apur%Type;
    Chave_w         Log_Det_Proc.Mens_Erro%Type;
    Cod_Erro_w      Log_Det_Proc.Cod_Erro%Type;
    Erro_Leitura Exception;
    Msg_Erro_w Varchar2(200);

  Begin

    If Ltrim(p_Cod_Empresa) Is Not Null Then
      Linha_w := Rpad(Ltrim(p_Cod_Empresa), 3, ' ') || Tab;
    Else
      Linha_w := Rpad('@', 3, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Estab) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Estab), 6, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
    End If;

    If Ltrim(p_Movto_e_s) Is Not Null Then
      Linha_w := Linha_w || p_Movto_e_s || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(p_Norm_Dev) Is Not Null Then
      Linha_w := Linha_w || p_Norm_Dev || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    Begin
      Select Cod_Docto
        Into Cod_Docto_w
        From X2005_Tipo_Docto
       Where Ident_Docto = p_Ident_Docto;

      If Ltrim(Cod_Docto_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Docto_w), 5, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60005;
        Chave_w    := p_Ident_Docto;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    Begin
      Select Cod_Fis_Jur, Ind_Fis_Jur
        Into Cod_Fis_Jur_w, Ind_Fis_Jur_w
        From X04_Pessoa_Fis_Jur
       Where Ident_Fis_Jur = p_Ident_Fis_Jur;

      If Ltrim(Ind_Fis_Jur_w) Is Not Null Then
        Linha_w := Linha_w || Ind_Fis_Jur_w || Tab;
      Else
        Linha_w := Linha_w || '@' || Tab;
      End If;

      If Ltrim(Cod_Fis_Jur_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Fis_Jur_w), 14, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60104;
        Chave_w    := p_Ident_Fis_Jur;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    If Ltrim(p_Num_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Docfis), 12, ' ') || Tab;
    End If;

    If Ltrim(p_Serie_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Serie_Docfis), 3, ' ') || Tab;
    End If;

    If Ltrim(p_Sub_Serie_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Sub_Serie_Docfis), 2, ' ') || Tab;
    End If;

    If p_Data_Emissao Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Data_Emissao, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Class_Doc_Fis) Is Not Null Then
      Linha_w := Linha_w || p_Cod_Class_Doc_Fis || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If p_Ident_Modelo Is Not Null Then
      Begin
        Select Cod_Modelo
          Into Cod_Modelo_w
          From X2024_Modelo_Docto
         Where Ident_Modelo = p_Ident_Modelo;

        If Ltrim(Cod_Modelo_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Modelo_w), 2, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60024;
          Chave_w    := p_Ident_Modelo;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If p_Ident_Cfo Is Not Null Then
      Begin
        Select Cod_Cfo
          Into Cod_Cfo_w
          From X2012_Cod_Fiscal
         Where Ident_Cfo = p_Ident_Cfo;

        If Ltrim(Cod_Cfo_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Cfo_w), 4, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60012;
          Chave_w    := p_Ident_Cfo;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
    End If;

    If p_Ident_Natureza_Op Is Not Null Then
      Begin
        Select Cod_Natureza_Op
          Into Cod_Natureza_Op_w
          From X2006_Natureza_Op
         Where Ident_Natureza_Op = p_Ident_Natureza_Op;

        If Ltrim(Cod_Natureza_Op_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Natureza_Op_w), 3, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
        End If;
      Exception
        When Others Then
          Cod_Erro_w := 60006;
          Chave_w    := p_Ident_Natureza_Op;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    End If;

    If Ltrim(p_Num_Docfis_Ref) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Docfis_Ref), 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    End If;

    If Ltrim(p_Serie_Docfis_Ref) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Serie_Docfis_Ref), 3, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    End If;

    If Ltrim(p_s_Ser_Docfis_Ref) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_s_Ser_Docfis_Ref), 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If Ltrim(p_Num_Dec_Imp_Ref) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Dec_Imp_Ref), 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    End If;

    If p_Data_Saida_Rec Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Data_Saida_Rec, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(p_Insc_Estad_Substit) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Insc_Estad_Substit), 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If p_Vlr_Produto Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Produto * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Tot_Nota Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Tot_Nota * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Frete Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Frete * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Seguro Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Seguro * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Outras Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Outras * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Base_Dif_Frete Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Base_Dif_Frete * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Desconto Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Desconto * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Contrib_Final Is Not Null Then
      Linha_w := Linha_w || p_Contrib_Final || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If p_Situacao Is Not Null Then
      Linha_w := Linha_w || p_Situacao || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(p_Cod_Indice) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Indice), 10, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
    End If;

    If p_Vlr_Nota_Conv Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Nota_Conv * 10000), 18, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 18, ' ') || Tab;
    End If;

    If p_Ident_Conta Is Not Null Then
      Begin
        Select Cod_Conta
          Into Cod_Conta_w
          From X2002_Plano_Contas
         Where Ident_Conta = p_Ident_Conta;

        If Ltrim(Cod_Conta_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Conta_w), 70, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 70, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60002;
          Chave_w    := p_Ident_Conta;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 70, ' ') || Tab;
    End If;

    /* PROCEDURE QUE RECUPERA OS TRIBUTOS E BASES PARA CADA NOTA */
    Rec_Trib_Base(p_Sub_Serie_Docfis,
                  p_Serie_Docfis,
                  p_Num_Docfis,
                  p_Ident_Fis_Jur,
                  p_Ident_Docto,
                  p_Norm_Dev,
                  p_Movto_e_s,
                  p_Data_Fiscal,
                  p_Cod_Estab,
                  p_Cod_Empresa);

    Linha_w := Linha_w || Nvl(Saf.Vlr_Aliq_Icms, Rpad('@', 7, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Icms, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Dif_Aliq_Icms, Rpad('@', 7, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Obs_Icms, Rpad('@', 45, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Cod_Apur_Icms, Rpad('@', 5, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Aliq_Ipi, Rpad('@', 7, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Ipi, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Obs_Ipi, Rpad('@', 45, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Cod_Apur_Ipi, Rpad('@', 5, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Aliq_Ir, Rpad('@', 7, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Ir, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Aliq_Iss, Rpad('@', 7, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Iss, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Aliq_Sub_Icms, Rpad('@', 7, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Subst_Icms, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Obs_Subst_Icms, Rpad('@', 45, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Cod_Apur_Sub_Icms, Rpad('@', 5, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Trib_Icms, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Isen_Icms, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Outr_Icms, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Redu_Icms, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Trib_Ipi, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Isen_Ipi, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Outr_Ipi, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Redu_Ipi, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Trib_Ir, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Isen_Ir, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Trib_Iss, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Isen_Iss, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Real_Terc_Iss, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Sub_Trib_Icms, Rpad('@', 17, ' ')) || Tab;

    /* GRAVA DADOS DE CUPOM FISCAL */
    Begin
      Num_Maquina_w    := Null;
      Num_Cupom_w      := Null;
      Num_Cont_Reduc_w := Null;

      Select Num_Maquina, Num_Cupom_Final, Num_Cont_Reduc
        Into Num_Maquina_w, Num_Cupom_w, Num_Cont_Reduc_w
        From X07_Cupom_Fiscal
       Where Sub_Serie_Docfis = p_Sub_Serie_Docfis
         And Serie_Docfis = p_Serie_Docfis
         And Num_Docfis = p_Num_Docfis
         And Ident_Fis_Jur = p_Ident_Fis_Jur
         And Ident_Docto = p_Ident_Docto
         And Norm_Dev = p_Norm_Dev
         And Movto_e_s = p_Movto_e_s
         And Data_Fiscal = p_Data_Fiscal
         And Cod_Estab = p_Cod_Estab
         And Cod_Empresa = p_Cod_Empresa;

      If Num_Maquina_w Is Not Null Then
        Linha_w := Linha_w || Lpad(To_Char(Num_Maquina_w), 6, '0') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
      End If;
      If Num_Cupom_w Is Not Null Then
        Linha_w := Linha_w || Lpad(To_Char(Num_Cupom_w), 6, '0') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
      End If;

    Exception
      When others Then
        Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
        Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
    End;

    If Ltrim(p_Ind_Modelo_Cupom) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Modelo_Cupom), 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If p_Vlr_Contab_Compl Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Contab_Compl * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Num_Controle_Docto) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Controle_Docto), 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Destino Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Aliq_Destino * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Nf_Especial) Is Not Null Then
      Linha_w := Linha_w || p_Ind_Nf_Especial || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(p_Ind_Tp_Frete) Is Not Null Then
      Linha_w := Linha_w || p_Ind_Tp_Frete || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If p_Cod_Municipio Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Cod_Municipio), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Transf_Cred) Is Not Null Then
      Linha_w := Linha_w || p_Ind_Transf_Cred || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If p_Dat_Di Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Dat_Di, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Vlr_Tom_Servico Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Tom_Servico * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Dat_Escr_Extemp Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Dat_Escr_Extemp, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Cod_Trib_Int Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Cod_Trib_Int), 5, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
    End If;

    If p_Cod_Regiao Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Cod_Regiao), 2, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If p_Dat_Autentic Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Dat_Autentic, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Canal_Distrib) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Canal_Distrib), 10, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
    End If;

    If Ltrim(Saf.Ind_Cred_Icmss) Is Not Null Then
      Linha_w := Linha_w || Saf.Ind_Cred_Icmss || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If p_Vlr_Icms_Ndestac Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Icms_Ndestac * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Ipi_Ndestac Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Ipi_Ndestac * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Base_Inss Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Base_Inss * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Inss Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Aliq_Inss * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Inss_Retido Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Inss_Retido * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Mat_Aplic_Iss Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Mat_Aplic_Iss * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Subempr_Iss Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Subempr_Iss * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Munic_Iss) Is Not Null Then
      Linha_w := Linha_w || p_Ind_Munic_Iss || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(p_Ind_Classe_Op_Iss) Is Not Null Then
      Linha_w := Linha_w || p_Ind_Classe_Op_Iss || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If p_Vlr_Outros1 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Outros1 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Dat_Fato_Gerador Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Dat_Fato_Gerador, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Dat_Cancelamento Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Dat_Cancelamento, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(p_Num_Pagina) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Pagina), 6, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
    End If;

    If Ltrim(p_Num_Livro) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Livro), 6, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
    End If;

    If Ltrim(p_Nro_Aidf_Nf) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Nro_Aidf_Nf), 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    End If;

    If p_Dat_Valid_Doc_Aidf Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Dat_Valid_Doc_Aidf, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Fatura) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Fatura), 1, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    If p_Ident_Quitacao Is Not Null Then
      Begin
        Select Cod_Quitacao
          Into Cod_Quitacao_w
          From X2014_Quitacao
         Where Ident_Quitacao = p_Ident_Quitacao;

        If Ltrim(Cod_Quitacao_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Quitacao_w), 5, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60124;
          Chave_w    := p_Ident_Quitacao;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
    End If;

    If Ltrim(p_Num_Selo_Cont_Icms) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Selo_Cont_Icms), 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    End If;

    If p_Vlr_Base_Pis Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Base_Pis * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Pis Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Pis * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Base_Cofins Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Base_Cofins * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Cofins Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Cofins * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Base_Icms_Origdest Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Base_Icms_Origdest * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Icms_Origdest Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Icms_Origdest * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Aliq_Icms_Origdest Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Aliq_Icms_Origdest * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Desc_Condic Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Desc_Condic * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    Linha_w := Linha_w || Nvl(Saf.Vlr_Base_Ise_Icmss, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Base_Out_Icmss, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Red_Base_Icmss, Rpad('@', 17, ' ')) || Tab;

    If p_Perc_Red_Base_Icms Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Perc_Red_Base_Icms * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    Cod_Fis_Jur_w := Null;
    Ind_Fis_Jur_w := Null;

    If p_Ident_Fisjur_Cpdir Is Not Null Then
      Begin
        Select Cod_Fis_Jur, Ind_Fis_Jur
          Into Cod_Fis_Jur_w, Ind_Fis_Jur_w
          From X04_Pessoa_Fis_Jur
         Where Ident_Fis_Jur = p_Ident_Fisjur_Cpdir;

        If Ltrim(Ind_Fis_Jur_w) Is Not Null Then
          Linha_w := Linha_w || Ind_Fis_Jur_w || Tab;
        Else
          Linha_w := Linha_w || '@' || Tab;
        End If;

        If Ltrim(Cod_Fis_Jur_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Fis_Jur_w), 14, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60104;
          Chave_w    := p_Ident_Fis_Jur;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Medidajudicial) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Medidajudicial), 1, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    If p_Ident_Uf_Orig_Dest Is Not Null Then
      Begin
        Select Cod_Estado
          Into Cod_Estado_w
          From Estado
         Where Ident_Estado = p_Ident_Uf_Orig_Dest;

        If Ltrim(Cod_Estado_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Estado_w), 2, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60102;
          Chave_w    := p_Ident_Uf_Orig_Dest;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Compra_Venda) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Compra_Venda), 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Tp_Disp_Seg) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Tp_Disp_Seg), 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If p_Num_Ctr_Disp Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Num_Ctr_Disp), 10, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
    End If;

    If Ltrim(p_Num_Fim_Docto) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Fim_Docto), 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    End If;

    If p_Ident_Uf_Destino Is Not Null Then
      Begin
        Select Cod_Estado
          Into Cod_Estado_w
          From Estado
         Where Ident_Estado = p_Ident_Uf_Destino;

        If Ltrim(Cod_Estado_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Estado_w), 2, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60102;
          Chave_w    := p_Ident_Uf_Destino;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If Ltrim(p_Serie_Ctr_Disp) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Serie_Ctr_Disp), 3, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    End If;

    If Ltrim(p_Sub_Serie_Ctr_Disp) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Sub_Serie_Ctr_Disp), 3, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Situacao_Esp) Is Not Null Then
      Linha_w := Linha_w || p_Ind_Situacao_Esp || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(p_Insc_Estadual) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Insc_Estadual), 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Pagto_Inss) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Pagto_Inss), 4, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
    End If;

    If p_Dat_Intern_Am Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Dat_Intern_Am, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    Cod_Fis_Jur_w := Null;
    Ind_Fis_Jur_w := Null;

    If p_Ident_Fisjur_Lsg Is Not Null Then
      Begin
        Select Cod_Fis_Jur, Ind_Fis_Jur
          Into Cod_Fis_Jur_w, Ind_Fis_Jur_w
          From X04_Pessoa_Fis_Jur
         Where Ident_Fis_Jur = p_Ident_Fisjur_Lsg;

        If Ltrim(Ind_Fis_Jur_w) Is Not Null Then
          Linha_w := Linha_w || Ind_Fis_Jur_w || Tab;
        Else
          Linha_w := Linha_w || '@' || Tab;
        End If;

        If Ltrim(Cod_Fis_Jur_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Fis_Jur_w), 14, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60104;
          Chave_w    := p_Ident_Fisjur_Lsg;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If Ltrim(p_Comprov_Exp) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Comprov_Exp), 15, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 15, ' ') || Tab;
    End If;

    If p_Num_Final_Crt_Disp Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Num_Final_Crt_Disp), 12, '0') || Tab;
    Else
      --     LINHA_W := LINHA_W||RPAD('@',12,' ');
      Linha_w := Linha_w || '000000000000' || Tab;
    End If;

    If Ltrim(p_Num_Alvara) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Alvara), 8, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(p_Notifica_Sefaz) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Notifica_Sefaz), 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If Ltrim(p_Interna_Suframa) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Interna_Suframa), 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Amparo) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Amparo), 10, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Nota_Servico) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Nota_Servico), 1, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Motivo) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Motivo), 10, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
    End If;

    If p_Ident_Estado_Ampar Is Not Null Then
      If p_Movto_e_s = '9' Then
        Begin
          Select b.Cod_Estado
            Into Cod_Estado_w
            From Estabelecimento a, Estado b
           Where a.Ident_Estado = b.Ident_Estado
             And a.Cod_Empresa = p_Cod_Empresa
             And a.Cod_Estab = Nvl(p_Cod_Estab, a.Cod_Estab)
             And Rownum = 1;

          If Ltrim(Cod_Estado_w) Is Not Null Then
            Linha_w := Linha_w || Rpad(Ltrim(Cod_Estado_w), 2, ' ') || Tab;
          Else
            Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
          End If;

        Exception
          When Others Then
            Cod_Erro_w := 91001;
            Chave_w    := Cod_Estado_w;
            Msg_Erro_w := Substr(Sqlerrm, 1, 200);
            Raise Erro_Leitura;
        End;
      Elsif p_Movto_e_s <> '9' Then
        Begin
          Select b.Cod_Estado
            Into Cod_Estado_w
            From X04_Pessoa_Fis_Jur a, Estado b
           Where a.Ident_Estado = b.Ident_Estado
             And a.Ident_Fis_Jur = p_Ident_Fis_Jur;

          If Ltrim(Cod_Estado_w) Is Not Null Then
            Linha_w := Linha_w || Rpad(Ltrim(Cod_Estado_w), 2, ' ') || Tab;
          Else
            Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
          End If;

        Exception
          When Others Then
            Cod_Erro_w := 50777;
            Chave_w    := p_Ident_Fis_Jur;
            Msg_Erro_w := Substr(Sqlerrm, 1, 200);
            Raise Erro_Leitura;
        End;
      End If;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If Ltrim(p_Obs_Compl_Motivo) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Obs_Compl_Motivo), 100, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 100, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Tp_Ret) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Tp_Ret), 1, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Tp_Tomador) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Tp_Tomador), 1, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    -- OS 1417
    -- Este campo não estará trabalhando com as funções LTRIM e RTRIM
    -- pois o espaço é um conteúdo válido e identifica
    -- Substituição Tributária informada pelo substituto
    -- ou pelo substituido que não incorra em nenhuma das situações anteriores
    If p_Cod_Antec_St Is Not Null Then
      Linha_w := Linha_w || Rpad(p_Cod_Antec_St, 1, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    If Ltrim(p_Cnpj_Armaz_Orig) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cnpj_Armaz_Orig), 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If p_Ident_Uf_Armaz_Orig Is Not Null Then
      Begin
        Select Cod_Estado
          Into Cod_Estado_w
          From Estado
         Where Ident_Estado = p_Ident_Uf_Armaz_Orig;

        If Ltrim(Cod_Estado_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Estado_w), 2, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60102;
          Chave_w    := p_Ident_Uf_Armaz_Orig;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If Ltrim(p_Ins_Est_Armaz_Orig) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ins_Est_Armaz_Orig), 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If Ltrim(p_Cnpj_Armaz_Dest) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cnpj_Armaz_Dest), 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If p_Ident_Uf_Armaz_Dest Is Not Null Then
      Begin
        Select Cod_Estado
          Into Cod_Estado_w
          From Estado
         Where Ident_Estado = p_Ident_Uf_Armaz_Dest;

        If Ltrim(Cod_Estado_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Estado_w), 2, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60102;
          Chave_w    := p_Ident_Uf_Armaz_Dest;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If Ltrim(p_Ins_Est_Armaz_Dest) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ins_Est_Armaz_Dest), 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If p_Obs_Inf_Adic_Nf Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Obs_Inf_Adic_Nf), 250, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 250, ' ') || Tab;
    End If;

    If p_Vlr_Base_Inss_2 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Base_Inss_2 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Inss_2 Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Aliq_Inss_2 * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Inss_Retido_2 Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Inss_Retido_2 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Cod_Pagto_Inss_2 Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Pagto_Inss_2), 4, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
    End If;

    If p_Vlr_Base_Pis_St Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Base_Pis_St * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Pis_St Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Aliq_Pis_St * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Pis_St Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Pis_St * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Base_Cofins_St Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Base_Cofins_St * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Cofins_St Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Aliq_Cofins_St * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Cofins_St Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Cofins_St * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Base_Csll Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Base_Csll * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Csll Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Aliq_Csll * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Csll Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Csll * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Pis Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Aliq_Pis * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Cofins Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Aliq_Cofins * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Base_Icmss_Substituido Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Base_Icmss_Substituido * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Icmss_Substituido Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Icmss_Substituido * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Situacao_Esp_St) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Situacao_Esp_St), 1, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    If p_Vlr_Icmss_Ndestac Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Icmss_Ndestac * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Docto_Rec) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Docto_Rec), 1, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    If p_Dat_Pgto_Gnre_Darj Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Dat_Pgto_Gnre_Darj, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Cod_Cei Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Cei), 15, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 15, ' ') || Tab;
    End If;

    If p_Vlr_Juros_Inss Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Juros_Inss * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Multa_Inss Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Multa_Inss * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Dt_Pagto_Nf Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Dt_Pagto_Nf, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Hora_Saida Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Hora_Saida), 6, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
    End If;

    If p_Cod_Sit_Docfis Is Not Null Then
      Linha_w := Linha_w || Rpad(p_Cod_Sit_Docfis, 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If p_Ident_Observacao Is Not Null Then
      Begin
        Select Cod_Observacao
          Into Cod_Observacao_w
          From X2009_Observacao
         Where Ident_Observacao = p_Ident_Observacao;

        If Ltrim(Cod_Observacao_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Observacao_w), 8, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
        End If;

      Exception
        When Others Then
          -- Erro no acesso a tabela X2009_OBSERVACAO
          Cod_Erro_w := 60009;
          Chave_w    := p_Ident_Observacao;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Ident_Situacao_a Is Not Null Then
      Begin
        Select Cod_Situacao_a
          Into Cod_Situacao_a_w
          From Y2025_Sit_Trb_Uf_a
         Where Ident_Situacao_a = p_Ident_Situacao_a;

        If Ltrim(Cod_Situacao_a_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Situacao_a_w), 1, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
        End If;

      Exception
        When Others Then
          -- Erro no acesso a tabela Y2025_SIT_TRB_UF_A
          Cod_Erro_w := 60049;
          Chave_w    := p_Ident_Situacao_a;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    If p_Ident_Situacao_b Is Not Null Then
      Begin
        Select Cod_Situacao_b
          Into Cod_Situacao_b_w
          From Y2026_Sit_Trb_Uf_b
         Where Ident_Situacao_b = p_Ident_Situacao_b;

        If Ltrim(Cod_Situacao_b_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Situacao_b_w), 2, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
        End If;

      Exception
        When Others Then
          -- Erro no acesso a tabela Y2026_SIT_TRB_UF_B
          Cod_Erro_w := 60050;
          Chave_w    := p_Ident_Situacao_b;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;

    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If Num_Cont_Reduc_w Is Not Null Then
      Linha_w := Linha_w || Rpad(Num_Cont_Reduc_w, 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    End If;

    -- OS2191 ---------------------
    -- COD_MUNICIPIO_ORIG
    If p_Cod_Municipio_Orig Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Cod_Municipio_Orig), 5, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
    End If;

    -- COD_MUNICIPIO_DEST
    If p_Cod_Municipio_Dest Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Cod_Municipio_Dest), 5, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
    End If;

    -- COD_CFPS
    If p_Cod_Cfps Is Not Null Then
      Linha_w := Linha_w || Rpad(p_Cod_Cfps, 4, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
    End If;

    -- NUM_LANCAMENTO
    If p_Num_Lancamento Is Not Null Then
      Linha_w := Linha_w || Rpad(p_Num_Lancamento, 40, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 40, ' ') || Tab;
    End If;

    -- VLR_MAT_PROP
    If p_Vlr_Mat_Prop Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Mat_Prop * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- VLR_MAT_TERC
    If p_Vlr_Mat_Terc Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Mat_Terc * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- VLR_BASE_ISS_RETIDO
    If p_Vlr_Base_Iss_Retido Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Base_Iss_Retido * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- VLR_ISS_RETIDO
    If p_Vlr_Iss_Retido Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Iss_Retido * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- VLR_DEDUCAO_ISS
    If p_Vlr_Deducao_Iss Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Deducao_Iss * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- COD_MUNIC_ARMAZ_ORIG
    If p_Cod_Munic_Armaz_Orig Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Cod_Munic_Armaz_Orig), 5, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
    End If;

    -- INS_MUNIC_ARMAZ_ORIG
    If p_Ins_Munic_Armaz_Orig Is Not Null Then
      Linha_w := Linha_w || Rpad(p_Ins_Munic_Armaz_Orig, 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    -- COD_MUNIC_ARMAZ_DEST
    If p_Cod_Munic_Armaz_Dest Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Cod_Munic_Armaz_Dest), 5, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
    End If;

    -- INS_MUNIC_ARMAZ_DEST
    If p_Ins_Munic_Armaz_Dest Is Not Null Then
      Linha_w := Linha_w || Rpad(p_Ins_Munic_Armaz_Dest, 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    -- COD_CLASSE_CONSUMO
    If p_Ident_Classe_Consumo Is Not Null Then
      Begin
        Select Cod_Classe_Consumo
          Into Cod_Classe_Consumo_w
          From Dwt_Classe_Consumo
         Where Ident_Classe_Consumo = p_Ident_Classe_Consumo;

        If Ltrim(Cod_Classe_Consumo_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Classe_Consumo_w), 2, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
        End If;

      Exception
        When Others Then
          -- Erro no acesso a tabela DWT_CLASSE_CONSUMO
          Cod_Erro_w := 60125;
          Chave_w    := p_Ident_Classe_Consumo;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    -- IND_ESPECIF_RECEITA
    If Ltrim(p_Ind_Especif_Receita) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Especif_Receita), 1, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    -- NUM_CONTRATO
    If p_Num_Contrato Is Not Null Then
      Linha_w := Linha_w || Rpad(p_Num_Contrato, 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    -- COD_AREA_TERMINAL
    If p_Cod_Area_Terminal Is Not Null Then
      Linha_w := Linha_w || Rpad(p_Cod_Area_Terminal, 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    -- COD_TP_UTIL
    If p_Cod_Tp_Util Is Not Null Then
      Linha_w := Linha_w || Rpad(p_Cod_Tp_Util, 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    -- GRUPO_TENSAO
    If p_Grupo_Tensao Is Not Null Then
      Linha_w := Linha_w || Rpad(p_Grupo_Tensao, 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    -- DATA_CONSUMO_INI
    If p_Data_Consumo_Ini Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Data_Consumo_Ini, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    -- DATA_CONSUMO_FIM
    If p_Data_Consumo_Fim Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Data_Consumo_Fim, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    -- DATA_CONSUMO_LEIT
    If p_Data_Consumo_Leit Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Data_Consumo_Leit, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    -- QTD_CONTRATADA_PONTA
    If p_Qtd_Contratada_Ponta Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Qtd_Contratada_Ponta * 1000000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- QTD_CONTRATADA_FPONTA
    If p_Qtd_Contratada_Fponta Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Qtd_Contratada_Fponta * 1000000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- QTD_CONSUMO_TOTAL
    If p_Qtd_Consumo_Total Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Qtd_Consumo_Total * 1000000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- UF_CONSUMO
    If p_Ident_Uf_Consumo Is Not Null Then
      Begin
        Select Cod_Estado
          Into Uf_Consumo_w
          From Estado
         Where Ident_Estado = p_Ident_Uf_Consumo;

        If Ltrim(Uf_Consumo_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Uf_Consumo_w), 2, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
        End If;

      Exception
        When Others Then
          -- Erro no acesso a tabela ESTADO
          Cod_Erro_w := 60102;
          Chave_w    := p_Ident_Uf_Consumo;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    -- ÚLTIMO CAMPO - SEM TAB
    -- COD_MUNIC_CONSUMO
    If p_Cod_Munic_Consumo Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Cod_Munic_Consumo), 5, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
    End If;

    -- OS 2220
    Cod_Oper_Esp_St_w := Rtrim(Ltrim(Nvl(p_Cod_Oper_Esp_St, '@')));
    Linha_w           := Linha_w || Substr(Cod_Oper_Esp_St_w, 1, 1) || Tab;

    -- FIM DA OS2191---------------------

    -- Primeiro campo da OS 2201
    If p_Ato_Normativo Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ato_Normativo), 20) || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 20, ' ') || Tab;
    End If;

    If p_Num_Ato_Normativo Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Num_Ato_Normativo), 5, 0) || Tab;
    Else
      Linha_w := Linha_w || Lpad('0', 5, '0') || Tab;
    End If;

    If p_Ano_Ato_Normativo Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Ano_Ato_Normativo), 4, 0) || Tab;
    Else
      Linha_w := Linha_w || Lpad('0', 4, '0') || Tab;
    End If;

    -- Último campo inserido pela OS 2201
    If p_Capitulacao_Norma Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Capitulacao_Norma), 30) || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 30, ' ') || Tab;
    End If;
    -- Os 2206 v3
    If p_Vlr_Outras_Entid Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Outras_Entid * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- Os 2206 v3
    If p_Vlr_Terceiros Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Terceiros * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Ind_Tp_Compl_Icms Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Tp_Compl_Icms), 2) || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    /* INICIO - OS 2302  */
    If p_Vlr_Base_Cide Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Base_Cide * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Cide Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Aliq_Cide * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Cide Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Cide * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    /* FIM - OS 2302  */

    /* INICIO - OS2286 */

    If p_Cod_Verific_Nfe Is Not Null Then
      Linha_w := Linha_w || Rpad(p_Cod_Verific_Nfe, 60, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 60, ' ') || Tab;
    End If;

    If p_Cod_Tp_Rps_Nfe Is Not Null Then
      Linha_w := Linha_w || Rpad(p_Cod_Tp_Rps_Nfe, 5, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
    End If;

    If p_Num_Rps_Nfe Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Num_Rps_Nfe), 12, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    End If;

    If p_Serie_Rps_Nfe Is Not Null Then
      Linha_w := Linha_w || Rpad(p_Serie_Rps_Nfe, 5, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
    End If;

    If p_Dat_Emissao_Rps_Nfe Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Dat_Emissao_Rps_Nfe, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Dsc_Servico_Nfe Is Not Null Then
      Linha_w := Linha_w || Rpad(p_Dsc_Servico_Nfe, 255, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 255, ' ') || Tab;
    End If;

    /* FIM - OS2286 */

    /* OS2295 */
    If p_Num_Autentic_Nfe Is Not Null Then
      Linha_w := Linha_w || Rpad(p_Num_Autentic_Nfe, 80, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 80, ' ') || Tab;
    End If;

    /* CH33683 */
    If Ltrim(p_Num_Dv_Nfe) Is Not Null Then
      Linha_w := Linha_w || p_Num_Dv_Nfe || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    -- OS2313
    If Ltrim(p_Modelo_Nf_Dms) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Modelo_Nf_Dms), 3, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Modelo_Cotepe) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Modelo_Cotepe), 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    --OS2403
    If p_Vlr_Comissao Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Vlr_Comissao * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    --os 2388-b
    If Ltrim(p_Ind_Nfe_Deneg_Inut) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Nfe_Deneg_Inut), 1, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Nf_Reg_Especial) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Nf_Reg_Especial), 1, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    If Ltrim(p_Vlr_Abat_Ntributado) Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Abat_Ntributado * 100), 15, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 15, ' ') || Tab;
    End If;

    If Ltrim(p_Vlr_Outros_Icms) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Outros_Icms * 100), 15, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 15, ' ') || Tab;
    End If;

    -- OS2466-A - ABasto
    If p_Hora_Emissao Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Hora_Emissao), 6, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
    End If;

    If p_Obs_Dados_Fatura Is Not Null Then
      Linha_w := Linha_w || Rpad(p_Obs_Dados_Fatura, 256, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 256, ' ') || Tab;
    End If;
    -- OS2388-Pdw
    If p_Ident_Fis_Conces Is Not Null Then
      Begin
        Select Cod_Fis_Jur, Ind_Fis_Jur
          Into Cod_Fis_Jur_w, Ind_Fis_Jur_w
          From X04_Pessoa_Fis_Jur
         Where Ident_Fis_Jur = p_Ident_Fis_Conces;

        If Ltrim(Ind_Fis_Jur_w) Is Not Null Then
          Linha_w := Linha_w || Ind_Fis_Jur_w || Tab;
        Else
          Linha_w := Linha_w || '@' || Tab;
        End If;

        If Ltrim(Cod_Fis_Jur_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Fis_Jur_w), 14, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60104;
          Chave_w    := p_Ident_Fis_Conces;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If p_Cod_Autentic Is Not Null Then
      Linha_w := Linha_w || Rpad(p_Cod_Autentic, 32, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 32, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Port_Cat44) Is Not Null Then
      Linha_w := Linha_w || p_Ind_Port_Cat44 || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    /* INICIO - OS2388-B2  */
    If p_VLR_BASE_INSS_RURAL Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_VLR_BASE_INSS_RURAL * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_VLR_ALIQ_INSS_RURAL Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_VLR_ALIQ_INSS_RURAL * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_VLR_INSS_RURAL Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_VLR_INSS_RURAL * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;
    /* FIM - OS2388-B2  */

    -- COD_CLASSE_CONSUMO_SEF_PE
    If p_Ident_Classe_Consumo_sef_pe Is Not Null Then
      Begin
        Select Cod_Classe_Consumo
          Into Cod_Classe_Consumo_sef_pe_w
          From Dwt_Classe_Consumo
         Where Ident_Classe_Consumo = p_Ident_Classe_Consumo_sef_pe;

        If Ltrim(Cod_Classe_Consumo_sef_pe_w) Is Not Null Then
          Linha_w := Linha_w ||
                     Rpad(Ltrim(Cod_Classe_Consumo_sef_pe_w), 2, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
        End If;

      Exception
        When Others Then
          -- Erro no acesso a tabela DWT_CLASSE_CONSUMO
          Cod_Erro_w := 60125;
          Chave_w    := p_Ident_Classe_Consumo_sef_pe;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    --OS3169-DW1

    If P_VLR_PIS_RETIDO Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_PIS_RETIDO * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_COFINS_RETIDO Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_COFINS_RETIDO * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_DAT_LANC_PIS_COFINS Is Not Null Then
      Linha_w := Linha_w || To_Char(P_DAT_LANC_PIS_COFINS, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(P_IND_PIS_COFINS_EXTEMP) Is Not Null Then
      Linha_w := Linha_w || P_IND_PIS_COFINS_EXTEMP || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(P_COD_SIT_PIS) Is Not Null Then
      -- OS2388-B
      Linha_w := Linha_w || Lpad(To_Char(P_COD_SIT_PIS), 2, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If Ltrim(P_COD_SIT_COFINS) Is Not Null Then
      -- OS2388-B
      Linha_w := Linha_w || Lpad(To_Char(P_COD_SIT_COFINS), 2, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If Ltrim(P_IND_NAT_FRETE) Is Not Null Then
      Linha_w := Linha_w || P_IND_NAT_FRETE || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(P_COD_NAT_REC) Is Not Null Then
      -- OS3169-DW11
      Linha_w := Linha_w || Lpad(To_Char(P_COD_NAT_REC), 3, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    End If;

    If Ltrim(P_IND_VENDA_CANC) Is Not Null Then
      -- OS3169-GE13B
      Linha_w := Linha_w || P_IND_VENDA_CANC || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(P_IND_NAT_BASE_CRED) Is Not Null Then
      -- OS3169-GE13B
      Linha_w := Linha_w || P_IND_NAT_BASE_CRED || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(P_IND_NF_CONTINGENCIA) Is Not Null Then
      Linha_w := Linha_w || P_IND_NF_CONTINGENCIA || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If P_VLR_ACRESCIMO Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_ACRESCIMO * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_ANTECIP_TRIB Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_ANTECIP_TRIB * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(Saf.IND_IPI_NDESTAC_DF) Is Not Null Then
      Linha_w := Linha_w || Saf.IND_IPI_NDESTAC_DF || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    -- OS3521
    If Ltrim(P_DSC_RESERVADO1) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_DSC_RESERVADO1), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If Ltrim(P_DSC_RESERVADO2) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_DSC_RESERVADO2), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If Ltrim(P_DSC_RESERVADO3) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_DSC_RESERVADO3), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If Ltrim(P_NUM_NFTS) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_NUM_NFTS), 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    End If;

    If Ltrim(P_IND_NF_VENDA_TERCEIROS) Is Not Null Then
      Linha_w := Linha_w || P_IND_NF_VENDA_TERCEIROS || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(P_DSC_RESERVADO4) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_DSC_RESERVADO4), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If Ltrim(P_DSC_RESERVADO5) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_DSC_RESERVADO5), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If P_DSC_RESERVADO6 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_DSC_RESERVADO6 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_DSC_RESERVADO7 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_DSC_RESERVADO7 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_DSC_RESERVADO8 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_DSC_RESERVADO8 * 100), 17, '0') || TAB;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || TAB;
    End If;

    /* OS3743 */
    If p_identif_DOCFIS Is Null Then
      Linha_w := Linha_w || Rpad('@', 128, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(p_identif_DOCFIS, 128, ' ') || Tab;
    End If;

    If p_cod_sistema_orig Is Null Then
      Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(p_cod_sistema_orig, 4, ' ') || Tab;
    End If;

    If P_IDENT_SCP Is Null Then
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    Else
      Begin
        Select cod_scp
          Into cod_scp_w
          From x2057_cod_scp
         Where ident_scp = P_IDENT_SCP;

        If Ltrim(cod_scp_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(cod_scp_w), 14, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
        End If;

      Exception
        When Others Then
          -- Erro no acesso a tabela DWT_CLASSE_CONSUMO
          Cod_Erro_w := 60125;
          Chave_w    := P_IDENT_SCP;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    End If;

    -- OS 4514
    If Ltrim(P_IND_PREST_SERV) Is Not Null Then
      Linha_w := Linha_w || P_IND_PREST_SERV || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(P_IND_TIPO_PROC) Is Not Null Then
      Linha_w := Linha_w || P_IND_TIPO_PROC || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(P_NUM_PROC_JUR) Is Not Null Then
      Linha_w := Linha_w || Rpad(P_NUM_PROC_JUR, 20, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 20, ' ') || Tab;
    End If;

    If Ltrim(P_IND_DEC_PROC) Is Not Null Then
      Linha_w := Linha_w || P_IND_DEC_PROC || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(P_IND_TIPO_AQUIS) Is Not Null Then
      Linha_w := Linha_w || P_IND_TIPO_AQUIS || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If P_VLR_DESC_GILRAT Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_DESC_GILRAT * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_DESC_SENAR Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_DESC_SENAR * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- OS 4514-D
    If P_CNPJ_SUBEMPREITEIRO Is Not Null Then
      Linha_w := Linha_w || Rpad(P_CNPJ_SUBEMPREITEIRO, 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If P_CNPJ_CPF_PROPRIETARIO_CNO Is Not Null Then
      Linha_w := Linha_w || Lpad(P_CNPJ_CPF_PROPRIETARIO_CNO, 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If P_VLR_RET_SUBEMPREITADO Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_RET_SUBEMPREITADO * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_NUM_DOCFIS_SERV Is Not Null Then
      Linha_w := Linha_w || Rpad(P_NUM_DOCFIS_SERV, 60, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 60, ' ') || Tab;
    End If;

    --MFS2101
    If P_VLR_FCP_UF_DEST Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_FCP_UF_DEST * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_ICMS_UF_DEST Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_ICMS_UF_DEST * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    /*ÚLTIMO CAMPO */ --MFS2101

    If P_VLR_ICMS_UF_ORIG Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_ICMS_UF_ORIG * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- MFS2967

    If P_VLR_CONTRIB_PREV Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_CONTRIB_PREV * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_GILRAT Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_GILRAT * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_CONTRIB_SENAR Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_CONTRIB_SENAR * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    --MFS11800
    If P_CPF_CNPJ Is Not Null Then
      Linha_w := Linha_w || Rpad(P_CPF_CNPJ, 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    --MFS13120
    If P_NUM_CERTIF_QUAL Is Not Null Then
      Linha_w := Linha_w || Rpad(P_NUM_CERTIF_QUAL, 10, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
    End If;

    --,P_OBS_REINF         IN VARCHAR2 --MFS14129

    --MFS13120
    If P_OBS_REINF Is Not Null Then
      Linha_w := Linha_w || Rpad(P_OBS_REINF, 250, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 250, ' ') || Tab;
    End If;

    If P_VLR_TOT_ADIC Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_TOT_ADIC * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_RET_SERV Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_RET_SERV * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_SERV_15 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_SERV_15 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_SERV_20 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_SERV_20 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_SERV_25 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_SERV_25 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    /*ÚLTIMO CAMPO */
    --I.MFS20985
    If P_VLR_IPI_DEV Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_IPI_DEV * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- MFS22545
    If P_VLR_SEST Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_SEST * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_SENAT Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_SENAT * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_IND_FIN_EMISSAO_NFE Is Not Null Then
      Linha_w := Linha_w || P_IND_FIN_EMISSAO_NFE || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If P_NUM_AUTENTIC_NFE_SUBST Is Not Null Then
      Linha_w := Linha_w || Rpad(P_NUM_AUTENTIC_NFE_SUBST, 80, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 80, ' ') || Tab;
    End If;

    If P_IND_VLR_ICMS_COB_ANT_ST Is Not Null Then
      Linha_w := Linha_w || P_IND_VLR_ICMS_COB_ANT_ST;
    Else
      Linha_w := Linha_w || '@';
    End If;

    Return Linha_w;

  End;

  Function X08(p_Cod_Empresa             IN Varchar2,
               p_Cod_Estab               IN Varchar2,
               p_Data_Fiscal             IN DATE,
               p_Movto_e_s               IN VARCHAR2,
               p_Norm_Dev                IN VARCHAR2,
               p_Ident_Docto             IN Number,
               p_Ident_Fis_Jur           IN Number,
               p_Num_Docfis              IN Varchar2,
               p_Serie_Docfis            IN Varchar2,
               p_Sub_Serie_Docfis        IN Varchar2,
               p_Discri_Item             IN Varchar2,
               p_Ident_Produto           IN Number,
               p_Ident_Und_Padrao        IN Number,
               p_Cod_Bem                 IN Varchar2,
               p_Cod_Inc_Bem             IN Varchar2,
               p_Valid_Bem               IN DATE,
               p_Num_Item                IN Number,
               p_Ident_Almox             IN Number,
               p_Ident_Custo             IN Number,
               p_Descricao_Compl         IN Varchar2,
               p_Ident_Cfo               IN Number,
               p_Ident_Natureza_Op       IN Number,
               p_Ident_Nbm               IN Number,
               p_Quantidade              IN Number,
               p_Ident_Medida            IN Number,
               p_Vlr_Unit                IN Number,
               p_Vlr_Item                IN Number,
               p_Vlr_Desconto            IN Number,
               p_Vlr_Frete               IN Number,
               p_Vlr_Seguro              IN Number,
               p_Vlr_Outras              IN Number,
               p_Ident_Situacao_a        IN Number,
               p_Ident_Situacao_b        IN Number,
               p_Ident_Federal           IN Number,
               p_Ind_Ipi_Incluso         IN VARCHAR2,
               p_Num_Romaneio            IN Varchar2,
               p_Data_Romaneio           IN DATE,
               p_Peso_Liquido            IN Number,
               p_Cod_Indice              IN Varchar2,
               p_Vlr_Item_Conver         IN Number,
               p_Num_Processo            IN Number,
               p_Ind_Gravacao            IN VARCHAR2,
               p_Vlr_Contab_Compl        IN Number,
               p_Vlr_Aliq_Destino        IN Number,
               p_Vlr_Outros1             IN Number,
               p_Vlr_Outros2             IN Number,
               p_Vlr_Outros3             IN Number,
               p_Vlr_Outros4             IN Number,
               p_Vlr_Outros5             IN Number,
               p_Vlr_Aliq_Outros1        IN Number,
               p_Vlr_Aliq_Outros2        IN Number,
               p_Vlr_Contab_Item         IN Number,
               p_Cod_Obs_Vcont_Comp      IN Varchar2,
               p_Cod_Obs_Vcont_Item      IN Varchar2,
               p_Vlr_Outros_Icms         IN Number,
               p_Vlr_Outros_Ipi          IN Number,
               p_Ind_Resp_Vcont_Itm      IN VARCHAR2,
               p_Num_Ato_Conces          IN Varchar2,
               p_Dat_Embarque            IN DATE,
               p_Num_Reg_Exp             IN Varchar2,
               p_Num_Desp_Exp            IN Varchar2,
               p_Vlr_Tom_Servico         IN Number,
               p_Vlr_Desp_Moeda_Exp      IN Number,
               p_Cod_Moeda_Negoc         IN Varchar2,
               p_Cod_Pais_Dest_Orig      IN Varchar2,
               p_Cod_Trib_Int            IN Number,
               p_Vlr_Icms_Ndestac        IN Number,
               p_Vlr_Ipi_Ndestac         IN Number,
               p_Vlr_Base_Pis            IN Number,
               p_Vlr_Pis                 IN Number,
               p_Vlr_Base_Cofins         IN Number,
               p_Vlr_Cofins              IN Number,
               p_Base_Icms_Origdest      IN Number,
               p_Vlr_Icms_Origdest       IN Number,
               p_Aliq_Icms_Origdest      IN Number,
               p_Vlr_Desc_Condic         IN Number,
               p_Vlr_Custo_Transf        IN Number,
               p_Perc_Red_Base_Icms      IN Number,
               p_Qtd_Embarcada           IN Number,
               p_Dat_Registro_Exp        IN DATE,
               p_Dat_Despacho            IN DATE,
               p_Dat_Averbacao           IN DATE,
               p_Dat_Di                  IN DATE,
               p_Num_Dec_Imp_Ref         IN Varchar2,
               p_Dsc_Mot_Ocor            IN Varchar2,
               p_Ident_Conta             IN Number,
               p_Vlr_Base_Icms_Orig      IN Number,
               p_Vlr_Trib_Icms_Orig      IN Number,
               p_Vlr_Base_Icms_Dest      IN Number,
               p_Vlr_Trib_Icms_Dest      IN Number,
               p_Vlr_Perc_Pres_Icms      IN Number,
               p_Vlr_Preco_Base_St       IN Number,
               p_Ident_Oper_Oil          IN Number,
               p_Cod_Dcr                 IN Varchar2,
               p_Ident_Projeto           IN Number,
               p_Dat_Operacao            IN DATE,
               p_Usuario                 IN Varchar2,
               p_Ind_Mov_Fis             IN VARCHAR2,
               p_Chassi                  IN Varchar2,
               p_Num_Docfis_Ref          IN Varchar2,
               p_Serie_Docfis_Ref        IN Varchar2,
               p_Sserie_Docfis_Ref       IN Varchar2,
               p_Vlr_Base_Pis_St         IN Number,
               p_Vlr_Aliq_Pis_St         IN Number,
               p_Vlr_Pis_St              IN Number,
               p_Vlr_Base_Cofins_St      IN Number,
               p_Vlr_Aliq_Cofins_St      IN Number,
               p_Vlr_Cofins_St           IN Number,
               p_Vlr_Base_Csll           IN Number,
               p_Vlr_Aliq_Csll           IN Number,
               p_Vlr_Csll                IN Number,
               p_Vlr_Aliq_Pis            IN Number,
               p_Vlr_Aliq_Cofins         IN Number,
               p_Ind_Situacao_Esp_St     IN VARCHAR2,
               p_Vlr_Icmss_Ndestac       IN Number,
               p_Ind_Docto_Rec           IN VARCHAR2,
               p_Dat_Pgto_Gnre_Darj      IN DATE,
               p_Vlr_Custo_Unit          IN Number,
               p_Quantidade_Conv         IN Number,
               p_Vlr_Fecp_Icms           IN Number,
               p_Vlr_Fecp_Difaliq        IN Number,
               p_Vlr_Fecp_Icms_St        IN Number,
               p_Vlr_Fecp_Fonte          IN Number,
               p_Vlr_Base_Icmss_n_Escrit IN Number,
               p_Vlr_Icmss_n_Escrit      IN Number,
               p_Cod_Trib_Ipi            IN Varchar2,
               p_Lote_Medicamento        IN Varchar2,
               p_Valid_Medicamento       IN DATE,
               p_Ind_Base_Medicamento    IN VARCHAR2,
               p_Vlr_Preco_Medicamento   IN Number,
               p_Ind_Tipo_Arma           IN VARCHAR2,
               p_Num_Serie_Arma          IN Varchar2,
               p_Num_Cano_Arma           IN Varchar2,
               p_Dsc_Arma                IN Varchar2,
               p_Ident_Observacao        IN Varchar2,
               p_Cod_Ex_Ncm              IN Varchar2,
               p_Cod_Ex_Imp              IN Varchar2,
               p_Cnpj_Operadora          IN Varchar2,
               p_Cpf_Operadora           IN Varchar2,
               p_Ident_Uf_Operadora      IN Number,
               p_Ins_Est_Operadora       IN Varchar2,
               p_Ind_Especif_Receita     IN VARCHAR2,
               p_Cod_Class_Item          IN Varchar2,
               p_Vlr_Preco_Suger         IN Number,
               p_Vlr_Terceiros           IN Number,
               p_Vlr_Base_Cide           IN Varchar2,
               p_Vlr_Aliq_Cide           IN Varchar2,
               p_Vlr_Cide                IN Varchar2,
               p_Cod_Oper_Esp_St         IN Varchar2,
               p_Vlr_Comissao            IN Varchar2,
               p_Vlr_Icms_Frete          IN Varchar2, -- OS 2379
               p_Vlr_Difal_Frete         IN Varchar2, -- OS 2379
               p_Ind_Vlr_Pis_Cofins      IN Varchar2, -- OS 2386
               p_Cod_Enquad_Ipi          IN Varchar2,
               p_Cod_Situacao_Pis        IN Number,
               p_Qtd_Base_Pis            IN Number,
               p_Vlr_Aliq_Pis_r          IN Number,
               p_Cod_Situacao_Cofins     IN Number,
               p_Qtd_Base_Cofins         IN Number,
               p_Vlr_Aliq_Cofins_r       IN Number,
               p_Item_Port_Tare          IN Varchar2,
               p_Vlr_Funrural            IN Number,
               p_Ind_Tp_Prod_Medic       IN Varchar2,
               p_Vlr_Custo_dca           IN Number,
               p_Cod_Tp_Lancto           IN Number,
               p_Vlr_Perc_Cred_Out       IN Number,
               p_Vlr_Cred_Out            IN Number,
               p_Vlr_ICMS_Dca            IN Number,
               p_Vlr_PIS_Exp             IN Number,
               p_Vlr_PIS_Trib            IN Number,
               p_Vlr_PIS_N_Trib          IN Number,
               p_Vlr_Cofins_Exp          IN Number,
               p_Vlr_Cofins_Trib         IN Number,
               p_Vlr_Cofins_N_Trib       IN Number,
               p_Cod_Enq_Legal           IN Number,
               p_Ind_gravacao_saics      IN Varchar2,
               P_DAT_LANC_PIS_COFINS     IN DATE, -- 3169-DW1
               P_IND_PIS_COFINS_EXTEMP   IN VARCHAR2, -- 3169-DW1
               P_IND_NATUREZA_FRETE      IN VARCHAR2, -- 3169-DW1
               P_COD_NAT_REC             IN NUMBER, -- 3169-DW11
               P_IND_NAT_BASE_CRED       IN Varchar2,
               P_VLR_ACRESCIMO           IN NUMBER,
               P_DSC_RESERVADO1          IN VARCHAR2, --3521
               P_DSC_RESERVADO2          IN VARCHAR2, --3521
               P_DSC_RESERVADO3          IN VARCHAR2, --3521
               P_COD_TRIB_PROD           IN VARCHAR2, -- OS3663
               P_DSC_RESERVADO4          IN VARCHAR2, --3749
               P_DSC_RESERVADO5          IN VARCHAR2, --3749
               P_DSC_RESERVADO6          IN Number, --3749
               P_DSC_RESERVADO7          IN Number, --3749
               P_DSC_RESERVADO8          IN Number, --3749
               P_INDICE_PROD_ACAB        IN VARCHAR2, -- OS 3663-B
               P_VLR_BASE_DIA_AM         IN Number,
               P_VLR_ALIQ_DIA_AM         IN Number,
               P_VLR_ICMS_DIA_AM         IN Number,
               P_VLR_ADUANEIRO           IN Number,
               P_COD_SITUACAO_PIS_ST     IN Number,
               P_COD_SITUACAO_COFINS_ST  IN Number,
               P_VLR_ALIQ_DCIP           IN Number,
               P_NUM_LI                  IN VARCHAR2 --MFS1750

              ,
               P_VLR_FCP_UF_DEST  IN NUMBER -- MFS2101
              ,
               P_VLR_ICMS_UF_DEST IN NUMBER -- MFS2101
              ,
               P_VLR_ICMS_UF_ORIG IN NUMBER -- MFS2101
              ,
               P_VLR_DIF_DUB      IN NUMBER --MFS 3484

              ,
               P_VLR_ICMS_NAO_DEST      IN NUMBER -- MFS 4881
              ,
               P_VLR_BASE_ICMS_NAO_DEST IN NUMBER,
               P_VLR_ALIQ_ICMS_NAO_DEST IN NUMBER,
               P_IND_MOTIVO_RES         IN VARCHAR2,
               P_NUM_DOCFIS_RET         IN VARCHAR2,
               P_SERIE_DOCFIS_RET       IN VARCHAR2,
               P_NUM_AUTENTIC_NFE_RET   IN VARCHAR2,
               P_NUM_ITEM_RET           IN NUMBER,
               P_IDENT_FIS_JUR_RET      IN NUMBER,
               P_IND_TP_DOC_ARREC       IN VARCHAR2,
               P_NUM_DOC_ARREC          IN VARCHAR2,
               P_IDENT_CFO_DCIP         IN VARCHAR2

              ,
               P_VLR_BASE_INSS         IN NUMBER,
               P_VLR_INSS_RETIDO       IN NUMBER,
               P_VLR_TOT_ADIC          IN NUMBER,
               P_VLR_N_RET_PRINC       IN NUMBER,
               P_VLR_N_RET_ADIC        IN NUMBER,
               P_VLR_ALIQ_INSS         IN NUMBER,
               P_VLR_RET_SERV          IN NUMBER,
               P_VLR_SERV_15           IN NUMBER,
               P_VLR_SERV_20           IN NUMBER,
               P_VLR_SERV_25           IN NUMBER,
               P_IND_TP_PROC_ADJ_PRINC IN VARCHAR2,
               P_IDENT_PROC_ADJ_PRINC  IN NUMBER,
               P_IDENT_SUSP_TBT_PRINC  IN NUMBER,
               P_NUM_PROC_ADJ_PRINC    IN VARCHAR2,
               P_IND_TP_PROC_ADJ_ADIC  IN VARCHAR2,
               P_IDENT_PROC_ADJ_ADIC   IN NUMBER,
               P_IDENT_SUSP_TBT_ADIC   IN NUMBER,
               P_NUM_PROC_ADJ_ADIC     IN VARCHAR2
               --I.MFS20985
              ,
               P_VLR_IPI_DEV         IN NUMBER,
               P_COD_BENEFICIO       IN VARCHAR2,
               P_VLR_ABAT_NTRIBUTADO IN NUMBER,
               P_VLR_CREDITO_MVA_SN  IN NUMBER,
               P_VLR_DESONERADO_ICMS IN NUMBER,
               P_VLR_DIFERIDO_ICMS   IN NUMBER,
               P_VLR_EXC_BC_PIS      IN NUMBER,
               P_VLR_EXC_BC_COFINS   IN NUMBER,
               P_COD_CSOSN           IN VARCHAR2,
               P_VLR_FECP_ALIQ_ICMS  IN NUMBER)

   Return Long Is
    Linha_w Long;

    /* DECLARACAO DE TIPOS */
    Type Tp_Trib_Base Is Record(
      Vlr_Aliq_Icms      Safx08.Vlr_Aliq_Icms%Type,
      Vlr_Icms           Safx08.Vlr_Icms%Type,
      Dif_Aliq_Icms      Safx08.Dif_Aliq_Icms%Type,
      Obs_Icms           Safx08.Obs_Icms%Type,
      Cod_Apur_Icms      Safx08.Cod_Apur_Icms%Type,
      Vlr_Aliq_Ipi       Safx08.Vlr_Aliq_Ipi%Type,
      Vlr_Ipi            Safx08.Vlr_Ipi%Type,
      Obs_Ipi            Safx08.Obs_Ipi%Type,
      Cod_Apur_Ipi       Safx08.Cod_Apur_Ipi%Type,
      Vlr_Aliq_Sub_Icms  Safx08.Vlr_Aliq_Sub_Icms%Type,
      Vlr_Subst_Icms     Safx08.Vlr_Subst_Icms%Type,
      Obs_Subst_Icms     Safx08.Obs_Subst_Icms%Type,
      Cod_Apur_Sub_Icms  Safx08.Cod_Apur_Sub_Icms%Type,
      Base_Redu_Icms     Safx08.Base_Redu_Icms%Type,
      Trib_Icms          Safx08.Trib_Icms%Type,
      Base_Icms          Safx08.Base_Icms%Type,
      Base_Redu_Ipi      Safx08.Base_Redu_Ipi%Type,
      Trib_Ipi           Safx08.Trib_Ipi%Type,
      Base_Ipi           Safx08.Base_Ipi%Type,
      Base_Redu_Icmss    Safx08.Base_Redu_Icmss%Type,
      Trib_Icmss         Safx08.Trib_Icmss%Type,
      Base_Icmss_Aux2    Safx08.Base_Icmss_Aux2%Type,
      Trib_Icmss_Aux2    Safx08.Trib_Icmss_Aux2%Type,
      Base_Sub_Trib_Icms Safx08.Base_Sub_Trib_Icms%Type,
      Ind_Cred_Icmss     Safx08.Ind_Cred_Icmss%Type,
      Ind_Fornec_Icmss   Safx08.Ind_Fornec_Icmss%Type,
      Trib_Icms_Aux      Safx08.Trib_Icms_Aux%Type,
      Base_Icms_Aux      Safx08.Base_Icms_Aux%Type,
      Trib_Ipi_Aux       Safx08.Trib_Ipi_Aux%Type,
      Base_Ipi_Aux       Safx08.Base_Ipi_Aux%Type,
      IND_IPI_NDESTAC_DF Safx08.IND_IPI_NDESTAC_DF%Type);

    /* VARIAVEIS DE TRABALHO */
    Saf               Tp_Trib_Base;
    Tab               Varchar2(20) := CHR(9);
    Cod_Docto_w       X2005_Tipo_Docto.Cod_Docto%Type;
    Ind_Fis_Jur_w     X04_Pessoa_Fis_Jur.Ind_Fis_Jur%Type;
    Cod_Fis_Jur_w     X04_Pessoa_Fis_Jur.Cod_Fis_Jur%Type;
    Ind_Produto_w     X2013_Produto.Ind_Produto%Type;
    Cod_Produto_w     X2013_Produto.Cod_Produto%Type;
    Cod_Und_Padrao_w  X2017_Und_Padrao.Cod_Und_Padrao%Type;
    Cod_Almox_w       X2021_Almoxarifado.Cod_Almox%Type;
    Cod_Custo_w       X2003_Centro_Custo.Cod_Custo%Type;
    Cod_Cfo_w         X2012_Cod_Fiscal.Cod_Cfo%Type;
    Cod_Natureza_Op_w X2006_Natureza_Op.Cod_Natureza_Op%Type;
    Cod_Medida_w      X2007_Medida.Cod_Medida%Type;
    Cod_Nbm_w         X2043_Cod_Nbm.Cod_Nbm%Type;
    Cod_Federal_w     X2044_Sit_Trib_Fed.Cod_Federal%Type;
    Cod_Situacao_w    Varchar2(2);
    Cod_Conta_w       X2002_Plano_Contas.Cod_Conta%Type;
    Cod_Oper_Oil_w    X2015_Operacao_Oil.Cod_Oper_Oil%Type;
    Cod_Projeto_w     X2016_Projeto.Cod_Projeto%Type;
    Cod_Observacao_w  X2009_Observacao.Cod_Observacao%Type;
    Uf_Operadora_w    Safx08.Uf_Operadora%Type;
    cod_cfo_dcip_w    X2012_Cod_Fiscal.Cod_Cfo%Type;

    NUM_PROC_ADJ_PRINC_W SAFX2058.NUM_PROC_ADJ%TYPE;
    COD_SUSP_PRINC_W     SAFX2059.COD_SUSP%TYPE;
    NUM_PROC_ADJ_ADIC_W  SAFX2058.NUM_PROC_ADJ%TYPE;
    COD_SUSP_ADIC_W      SAFX2059.COD_SUSP%TYPE;

    /* VARIAVEIS DE TRATAMENTO DE ERRO */
    Chave_w    Log_Det_Proc.Mens_Erro%Type;
    Cod_Erro_w Log_Det_Proc.Cod_Erro%Type;
    Erro_Leitura Exception;
    Msg_Erro_w Varchar2(200);

    Procedure Rec_Trib_Base(p_Discri_Item   In Varchar2,
                            p_Sub_Serie     In Varchar2,
                            p_Serie         In Varchar2,
                            p_Numdoc        In Varchar2,
                            p_Ident_Fis_Jur In Number,
                            p_Ident_Docto   In Number,
                            p_Norm_Dev      IN VARCHAR2,
                            p_Movto_e_s     IN VARCHAR2,
                            p_Data_Fiscal   In Date,
                            p_Cod_Estab     In Varchar2,
                            p_Cod_Empresa   In Varchar2) Is

      Rnulo           Tp_Trib_Base;
      Cod_Oper_Apur_w Detalhe_Operacao.Cod_Oper_Apur%Type;

    Begin
      Saf     := Rnulo;
      Chave_w := p_Cod_Empresa || ' - ' || p_Cod_Estab || ' - ' ||
                 p_Data_Fiscal || ' - ' || p_Movto_e_s || ' - ' ||
                 p_Norm_Dev || ' - ' || p_Ident_Docto || ' - ' ||
                 p_Ident_Fis_Jur || ' - ' || p_Numdoc || ' - ' || p_Serie ||
                 ' - ' || p_Sub_Serie || ' - ' || p_Discri_Item;

      /* ----------------- RECUPERA TRIBUTOS -------------------------- */
      For Rt In (Select *
                   From X08_Trib_Merc
                  Where Discri_Item = p_Discri_Item
                    And Sub_Serie_Docfis = p_Sub_Serie
                    And Serie_Docfis = p_Serie
                    And Num_Docfis = p_Numdoc
                    And Ident_Fis_Jur = p_Ident_Fis_Jur
                    And Ident_Docto = p_Ident_Docto
                    And Norm_Dev = p_Norm_Dev
                    And Movto_e_s = p_Movto_e_s
                    And Data_Fiscal = p_Data_Fiscal
                    And Cod_Estab = p_Cod_Estab
                    And Cod_Empresa = p_Cod_Empresa) Loop
        Begin
          Cod_Oper_Apur_w := Null;
          If Rt.Ident_Det_Operacao Is Not Null Then
            Begin
              Select Cod_Det_Operacao
                Into Cod_Oper_Apur_w
                From Detalhe_Operacao
               Where Ident_Det_Operacao = Rt.Ident_Det_Operacao;
            Exception
              When No_Data_Found Then
                Cod_Oper_Apur_w := Null;
            End;
          End If;

          If Rt.Cod_Tributo = 'ICMS' Then
            If Rt.Aliq_Tributo Is Not Null Then
              Saf.Vlr_Aliq_Icms := Lpad(To_Char(Rt.Aliq_Tributo * 10000),
                                        7,
                                        '0');
            End If;
            If Rt.Vlr_Tributo Is Not Null Then
              Saf.Vlr_Icms := Lpad(To_Char(Rt.Vlr_Tributo * 100), 17, '0');
            End If;
            If Rt.Dif_Aliq_Tributo Is Not Null Then
              Saf.Dif_Aliq_Icms := Lpad(To_Char(Rt.Dif_Aliq_Tributo * 10000),
                                        7,
                                        '0');
            End If;
            Saf.Obs_Icms      := Rpad(Ltrim(Rt.Obs_Tributo), 45, ' ');
            Saf.Cod_Apur_Icms := Rpad(Ltrim(Cod_Oper_Apur_w), 5, ' ');
          Elsif Rt.Cod_Tributo = 'IPI' Then
            If Rt.Aliq_Tributo Is Not Null Then
              Saf.Vlr_Aliq_Ipi := Lpad(To_Char(Rt.Aliq_Tributo * 10000),
                                       7,
                                       '0');
            End If;
            If Rt.Vlr_Tributo Is Not Null Then
              Saf.Vlr_Ipi := Lpad(To_Char(Rt.Vlr_Tributo * 100), 17, '0');
            End If;
            Saf.Obs_Ipi            := Rpad(Ltrim(Rt.Obs_Tributo), 45, ' ');
            Saf.Cod_Apur_Ipi       := Rpad(Ltrim(Cod_Oper_Apur_w), 5, ' ');
            Saf.IND_IPI_NDESTAC_DF := Rt.IND_IPI_NDESTAC_DF;
          Elsif Rt.Cod_Tributo = 'ICMS-S' Then
            If Rt.Aliq_Tributo Is Not Null Then
              Saf.Vlr_Aliq_Sub_Icms := Lpad(To_Char(Rt.Aliq_Tributo * 10000),
                                            7,
                                            '0');
            End If;
            If Rt.Vlr_Tributo Is Not Null Then
              Saf.Vlr_Subst_Icms := Lpad(To_Char(Rt.Vlr_Tributo * 100),
                                         17,
                                         '0');
            End If;
            Saf.Obs_Subst_Icms    := Rpad(Ltrim(Rt.Obs_Tributo), 45, ' ');
            Saf.Cod_Apur_Sub_Icms := Rpad(Ltrim(Cod_Oper_Apur_w), 5, ' ');
            Saf.Ind_Cred_Icmss    := Rt.Ind_Cred_Tributo;
            Saf.Ind_Fornec_Icmss  := Rt.Ind_Fornec_Tributo;
          End If;

        Exception
          When Others Then
            Cod_Erro_w := 60109;
            Msg_Erro_w := Substr(Sqlerrm, 1, 200);
            Raise Erro_Leitura;
        End;
      End Loop; -- FIM LOOP TRIBUTOS

      /* ----------------------  RECUPERA BASES ---------------------------- */
      For Rb In (Select *
                   From X08_Base_Merc
                  Where Discri_Item = p_Discri_Item
                    And Sub_Serie_Docfis = p_Sub_Serie
                    And Serie_Docfis = p_Serie
                    And Num_Docfis = p_Numdoc
                    And Ident_Fis_Jur = p_Ident_Fis_Jur
                    And Ident_Docto = p_Ident_Docto
                    And Norm_Dev = p_Norm_Dev
                    And Movto_e_s = p_Movto_e_s
                    And Data_Fiscal = p_Data_Fiscal
                    And Cod_Estab = p_Cod_Estab
                    And Cod_Empresa = p_Cod_Empresa) Loop
        Begin
          If Rb.Vlr_Base Is Not Null Then
            If Rb.Cod_Tributo = 'ICMS' Then
              If Rb.Cod_Tributacao = 4 Then
                Saf.Base_Redu_Icms := Lpad(To_Char(Rb.Vlr_Base * 100),
                                           17,
                                           '0');
              Elsif Saf.Trib_Icms Is Null And Saf.Base_Icms Is Null Then
                Saf.Trib_Icms := To_Char(Rb.Cod_Tributacao);
                Saf.Base_Icms := Lpad(To_Char(Rb.Vlr_Base * 100), 17, '0');
              Else
                Saf.Trib_Icms_Aux := To_Char(Rb.Cod_Tributacao);
                Saf.Base_Icms_Aux := Lpad(To_Char(Rb.Vlr_Base * 100),
                                          17,
                                          '0');
              End If;
            Elsif Rb.Cod_Tributo = 'IPI' Then
              If Rb.Cod_Tributacao = 4 Then
                Saf.Base_Redu_Ipi := Lpad(To_Char(Rb.Vlr_Base * 100),
                                          17,
                                          '0');
              Elsif Saf.Trib_Ipi Is Null And Saf.Base_Ipi Is Null Then
                Saf.Trib_Ipi := To_Char(Rb.Cod_Tributacao);
                Saf.Base_Ipi := Lpad(To_Char(Rb.Vlr_Base * 100), 17, '0');
              Else
                Saf.Trib_Ipi_Aux := To_Char(Rb.Cod_Tributacao);
                Saf.Base_Ipi_Aux := Lpad(To_Char(Rb.Vlr_Base * 100),
                                         17,
                                         '0');
              End If;
            Elsif Rb.Cod_Tributo = 'ICMS-S' Then
              If Rb.Cod_Tributacao = 1 Then
                Saf.Base_Sub_Trib_Icms := Lpad(To_Char(Rb.Vlr_Base * 100),
                                               17,
                                               '0');
              Elsif Saf.Trib_Icmss Is Null And Saf.Base_Redu_Icmss Is Null Then
                Saf.Trib_Icmss      := To_Char(Rb.Cod_Tributacao);
                Saf.Base_Redu_Icmss := Lpad(To_Char(Rb.Vlr_Base * 100),
                                            17,
                                            '0');
              Else
                Saf.Trib_Icmss_Aux2 := To_Char(Rb.Cod_Tributacao);
                Saf.Base_Icmss_Aux2 := Lpad(To_Char(Rb.Vlr_Base * 100),
                                            17,
                                            '0');
              End If;
            End If;
          End If;

        Exception
          When Others Then
            Cod_Erro_w := 60110;
            Msg_Erro_w := Substr(Sqlerrm, 1, 200);
            Raise Erro_Leitura;
        End;
      End Loop; -- FIM LOOP BASES
    End Rec_Trib_Base;

  Begin

    If Ltrim(p_Cod_Empresa) Is Not Null Then
      Linha_w := Rpad(Ltrim(p_Cod_Empresa), 3, ' ') || Tab;
    Else
      Linha_w := Rpad('@', 3, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Estab) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Estab), 6, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
    End If;

    If Ltrim(p_Data_Fiscal) Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Data_Fiscal, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(p_Movto_e_s) Is Not Null Then
      Linha_w := Linha_w || p_Movto_e_s || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(p_Norm_Dev) Is Not Null Then
      Linha_w := Linha_w || p_Norm_Dev || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    Begin
      Select Cod_Docto
        Into Cod_Docto_w
        From X2005_Tipo_Docto
       Where Ident_Docto = p_Ident_Docto;

      If Ltrim(Cod_Docto_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Docto_w), 5, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60005;
        Chave_w    := p_Ident_Docto;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    Begin
      Select Cod_Fis_Jur, Ind_Fis_Jur
        Into Cod_Fis_Jur_w, Ind_Fis_Jur_w
        From X04_Pessoa_Fis_Jur
       Where Ident_Fis_Jur = p_Ident_Fis_Jur;

      If Ltrim(Ind_Fis_Jur_w) Is Not Null Then
        Linha_w := Linha_w || Ind_Fis_Jur_w || Tab;
      Else
        Linha_w := Linha_w || '@' || Tab;
      End If;

      If Ltrim(Cod_Fis_Jur_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Fis_Jur_w), 14, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60104;
        Chave_w    := p_Ident_Fis_Jur;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    If Ltrim(p_Num_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Docfis), 12, ' ') || Tab;
    End If;

    If Ltrim(p_Serie_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Serie_Docfis), 3, ' ') || Tab;
    End If;

    If Ltrim(p_Sub_Serie_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Sub_Serie_Docfis), 2, ' ') || Tab;
    End If;

    /* TRATAMENTO DO CAMPO IND_BEM_PATR */
    If Ltrim(p_Cod_Bem) Is Not Null Then
      Linha_w := Linha_w || 'S' || Tab;
    Elsif p_Ident_Produto Is Not Null Then
      Linha_w := Linha_w || 'N' || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If p_Ident_Produto Is Not Null Then
      Begin
        Select Ind_Produto, Cod_Produto
          Into Ind_Produto_w, Cod_Produto_w
          From X2013_Produto
         Where Ident_Produto = p_Ident_Produto;

        If Ltrim(Ind_Produto_w) Is Not Null Then
          Linha_w := Linha_w || Ind_Produto_w || Tab;
        Else
          Linha_w := Linha_w || '@' || Tab;
        End If;

        If Ltrim(Cod_Produto_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Produto_w), 35, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 35, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60013;
          Chave_w    := p_Ident_Produto;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || '@' || Tab;
      Linha_w := Linha_w || Rpad('@', 35, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Bem) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Bem), 30, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 30, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Inc_Bem) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Inc_Bem), 6, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
    End If;

    If p_Ident_Und_Padrao Is Not Null Then
      Begin
        Select Cod_Und_Padrao
          Into Cod_Und_Padrao_w
          From X2017_Und_Padrao
         Where Ident_Und_Padrao = p_Ident_Und_Padrao;
        If Ltrim(Cod_Und_Padrao_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Und_Padrao_w), 8, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60017;
          Chave_w    := p_Ident_Und_Padrao;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Num_Item Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Num_Item), 5, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
    End If;

    If p_Ident_Almox Is Not Null Then
      Begin
        Select Cod_Almox
          Into Cod_Almox_w
          From X2021_Almoxarifado
         Where Ident_Almox = p_Ident_Almox;

        If Ltrim(Cod_Almox_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Almox_w), 20, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 20, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60021;
          Chave_w    := p_Ident_Almox;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 20, ' ') || Tab;
    End If;

    If p_Ident_Custo Is Not Null Then
      Begin
        Select Cod_Custo
          Into Cod_Custo_w
          From X2003_Centro_Custo
         Where Ident_Custo = p_Ident_Custo;

        If Ltrim(Cod_Custo_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Custo_w), 20, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 20, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60003;
          Chave_w    := p_Ident_Custo;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 20, ' ') || Tab;
    End If;

    If Ltrim(p_Descricao_Compl) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Descricao_Compl), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If p_Ident_Cfo Is Not Null Then
      Begin
        Select Cod_Cfo
          Into Cod_Cfo_w
          From X2012_Cod_Fiscal
         Where Ident_Cfo = p_Ident_Cfo;

        If Ltrim(Cod_Cfo_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Cfo_w), 4, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60012;
          Chave_w    := p_Ident_Cfo;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
    End If;

    If p_Ident_Natureza_Op Is Not Null Then
      Begin
        Select Cod_Natureza_Op
          Into Cod_Natureza_Op_w
          From X2006_Natureza_Op
         Where Ident_Natureza_Op = p_Ident_Natureza_Op;

        If Ltrim(Cod_Natureza_Op_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Natureza_Op_w), 3, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60006;
          Chave_w    := p_Ident_Natureza_Op;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    End If;

    If p_Quantidade Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Quantidade * 1000000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Ident_Medida Is Not Null Then
      Begin
        Select Cod_Medida
          Into Cod_Medida_w
          From X2007_Medida
         Where Ident_Medida = p_Ident_Medida;

        If Ltrim(Cod_Medida_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Medida_w), 8, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60007;
          Chave_w    := p_Ident_Medida;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Ident_Nbm Is Not Null Then
      Begin
        Select Cod_Nbm
          Into Cod_Nbm_w
          From X2043_Cod_Nbm
         Where Ident_Nbm = p_Ident_Nbm;

        If Ltrim(Cod_Nbm_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Nbm_w), 10, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60043;
          Chave_w    := p_Ident_Nbm;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
    End If;

    If p_Vlr_Unit Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Unit * 10000), 19, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 19, ' ') || Tab;
    End If;

    If p_Vlr_Item Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Item * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Desconto Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Desconto * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Ident_Situacao_a Is Not Null Then
      Begin
        Select Cod_Situacao_a
          Into Cod_Situacao_w
          From Y2025_Sit_Trb_Uf_a
         Where Ident_Situacao_a = p_Ident_Situacao_a;

        If Ltrim(Cod_Situacao_w) Is Not Null Then
          Linha_w := Linha_w || Cod_Situacao_w || Tab;
        Else
          Linha_w := Linha_w || '@' || Tab;
        End If;

      Exception
        When No_Data_Found Then
          /*Cod_Erro_w := 60046;
          Chave_w    := p_Ident_Situacao_a;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;*/
          Linha_w := Linha_w || '@' || Tab;
        When Others Then
          Cod_Erro_w := 60046;
          Chave_w    := p_Ident_Situacao_a;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If p_Ident_Situacao_b Is Not Null Then
      Begin
        Select Cod_Situacao_b
          Into Cod_Situacao_w
          From Y2026_Sit_Trb_Uf_b
         Where Ident_Situacao_b = p_Ident_Situacao_b;

        If Ltrim(Cod_Situacao_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Situacao_w), 2, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60041;
          Chave_w    := p_Ident_Situacao_b;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If p_Ident_Federal Is Not Null Then
      Begin
        Select Cod_Federal
          Into Cod_Federal_w
          From X2044_Sit_Trib_Fed
         Where Ident_Federal = p_Ident_Federal;

        If Ltrim(Cod_Federal_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Federal_w), 5, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60044;
          Chave_w    := p_Ident_Federal;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Ipi_Incluso) Is Not Null Then
      Linha_w := Linha_w || p_Ind_Ipi_Incluso || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(p_Num_Romaneio) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Romaneio), 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    End If;

    If p_Data_Romaneio Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Data_Romaneio, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Peso_Liquido Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Peso_Liquido * 1000), 14, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Indice) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Indice), 10, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
    End If;

    If p_Vlr_Item_Conver Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Item_Conver * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Frete Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Frete * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Seguro Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Seguro * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Outras Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Outras * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    Rec_Trib_Base(p_Discri_Item,
                  p_Sub_Serie_Docfis,
                  p_Serie_Docfis,
                  p_Num_Docfis,
                  p_Ident_Fis_Jur,
                  p_Ident_Docto,
                  p_Norm_Dev,
                  p_Movto_e_s,
                  p_Data_Fiscal,
                  p_Cod_Estab,
                  p_Cod_Empresa);

    Linha_w := Linha_w || Nvl(Saf.Vlr_Aliq_Icms, Rpad('@', 7, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Icms, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Dif_Aliq_Icms, Rpad('@', 7, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Obs_Icms, Rpad('@', 45, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Cod_Apur_Icms, Rpad('@', 5, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Aliq_Ipi, Rpad('@', 7, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Ipi, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Obs_Ipi, Rpad('@', 45, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Cod_Apur_Ipi, Rpad('@', 5, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Aliq_Sub_Icms, Rpad('@', 7, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Subst_Icms, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Obs_Subst_Icms, Rpad('@', 45, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Cod_Apur_Sub_Icms, Rpad('@', 5, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Trib_Icms, '@') || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Icms, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Redu_Icms, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Trib_Ipi, '@') || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Ipi, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Redu_Ipi, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Sub_Trib_Icms, Rpad('@', 17, ' ')) || Tab;

    If p_Vlr_Contab_Compl Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Contab_Compl * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Destino Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Aliq_Destino * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Contab_Item Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Contab_Item * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Obs_Vcont_Comp) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Obs_Vcont_Comp), 10, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Obs_Vcont_Item) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Obs_Vcont_Item), 10, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
    End If;

    If p_Vlr_Outros_Icms Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Outros_Icms * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Outros_Ipi Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Outros_Ipi * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Outros1 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Outros1 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Num_Ato_Conces) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Ato_Conces), 15, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 15, ' ') || Tab;
    End If;

    If p_Dat_Embarque Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Dat_Embarque, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(p_Num_Reg_Exp) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Reg_Exp), 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    End If;

    If Ltrim(p_Num_Desp_Exp) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Desp_Exp), 11, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 11, ' ') || Tab;
    End If;

    If p_Vlr_Tom_Servico Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Tom_Servico * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Desp_Moeda_Exp Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Desp_Moeda_Exp * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Moeda_Negoc) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Moeda_Negoc), 10, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Pais_Dest_Orig) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Pais_Dest_Orig), 3, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    End If;

    /* TRATAMENTO DO CAMPO IND_CRED_ICMSS */
    Linha_w := Linha_w || Nvl(Saf.Ind_Cred_Icmss, '@') || Tab;

    If Ltrim(p_Cod_Trib_Int) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Cod_Trib_Int), 5, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
    End If;

    If p_Vlr_Icms_Ndestac Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Icms_Ndestac * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Ipi_Ndestac Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Ipi_Ndestac * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    /* TRIB_ICMS_AUX E BASE_ICMS_AUX */
    Linha_w := Linha_w || Nvl(Saf.Trib_Icms_Aux, '@') || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Icms_Aux, Rpad('@', 17, ' ')) || Tab;

    /* TRIB_IPI_AUX E BASE_IPI_AUX */
    Linha_w := Linha_w || Nvl(Saf.Trib_Ipi_Aux, '@') || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Ipi_Aux, Rpad('@', 17, ' ')) || Tab;

    If p_Vlr_Base_Pis Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Base_Pis * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Pis Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Pis * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Base_Cofins Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Base_Cofins * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Cofins Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Cofins * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Base_Icms_Origdest Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Base_Icms_Origdest * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Icms_Origdest Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Icms_Origdest * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Aliq_Icms_Origdest Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Aliq_Icms_Origdest * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Desc_Condic Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Desc_Condic * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    /* TRIB_IPI_AUX E BASE_IPI_AUX */
    Linha_w := Linha_w || Nvl(Saf.Trib_Icmss, '@') || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Redu_Icmss, Rpad('@', 17, ' ')) || Tab;

    If p_Vlr_Custo_Transf Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Custo_Transf * 1000000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Perc_Red_Base_Icms Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Perc_Red_Base_Icms * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Qtd_Embarcada Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Qtd_Embarcada * 1000000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Dat_Registro_Exp Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Dat_Registro_Exp, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Dat_Despacho Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Dat_Despacho, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Dat_Averbacao Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Dat_Averbacao, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Dat_Di Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Dat_Di, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(p_Num_Dec_Imp_Ref) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Dec_Imp_Ref), 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    End If;

    If Ltrim(p_Dsc_Mot_Ocor) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Dsc_Mot_Ocor), 45, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 45, ' ') || Tab;
    End If;

    If p_Ident_Conta Is Not Null Then
      Begin
        Select Cod_Conta
          Into Cod_Conta_w
          From X2002_Plano_Contas
         Where Ident_Conta = p_Ident_Conta;

        If Ltrim(Cod_Conta_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Conta_w), 70, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 70, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60002;
          Chave_w    := p_Ident_Conta;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 70, ' ') || Tab;
    End If;

    If p_Vlr_Base_Icms_Orig Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Base_Icms_Orig * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Trib_Icms_Orig Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Trib_Icms_Orig * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Base_Icms_Dest Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Base_Icms_Dest * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Trib_Icms_Dest Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Trib_Icms_Dest * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Perc_Pres_Icms Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Perc_Pres_Icms * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Preco_Base_St Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Preco_Base_St * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Ident_Oper_Oil Is Not Null Then
      Begin
        Select Cod_Oper_Oil
          Into Cod_Oper_Oil_w
          From X2015_Operacao_Oil
         Where Ident_Oper_Oil = p_Ident_Oper_Oil;

        If Ltrim(Cod_Oper_Oil_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Oper_Oil_w), 10, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60015;
          Chave_w    := p_Ident_Oper_Oil;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Dcr) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Dcr), 15, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 15, ' ') || Tab;
    End If;

    If p_Ident_Projeto Is Not Null Then
      Begin
        Select Cod_Projeto
          Into Cod_Projeto_w
          From X2016_Projeto
         Where Ident_Projeto = p_Ident_Projeto;

        If Ltrim(Cod_Projeto_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Projeto_w), 20, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 20, ' ') || Tab;
        End If;

      Exception

        When Others Then
          Cod_Erro_w := 60016;
          Chave_w    := p_Ident_Projeto;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 20, ' ') || Tab;
    End If;

    If p_Ind_Mov_Fis Is Not Null Then
      Linha_w := Linha_w || p_Ind_Mov_Fis || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If p_Chassi Is Not Null Then
      Linha_w := Linha_w || Lpad(p_Chassi, 17, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Num_Docfis_Ref Is Not Null Then
      Linha_w := Linha_w || Lpad(p_Num_Docfis_Ref, 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    End If;

    If p_Serie_Docfis_Ref Is Not Null Then
      Linha_w := Linha_w || Lpad(p_Serie_Docfis_Ref, 3, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    End If;

    If p_Sserie_Docfis_Ref Is Not Null Then
      Linha_w := Linha_w || Lpad(p_Sserie_Docfis_Ref, 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If p_Vlr_Base_Pis_St Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Base_Pis_St * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Pis_St Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Aliq_Pis_St * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Pis_St Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Pis_St * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Base_Cofins_St Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Base_Cofins_St * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Cofins_St Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Aliq_Cofins_St * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Cofins_St Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Cofins_St * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Base_Csll Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Base_Csll * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Csll Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Aliq_Csll * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Csll Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Csll * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Pis Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Aliq_Pis * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Cofins Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Aliq_Cofins * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    Linha_w := Linha_w || Nvl(Saf.Ind_Fornec_Icmss, '@') || Tab;

    If Ltrim(p_Ind_Situacao_Esp_St) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Situacao_Esp_St), 1, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    If p_Vlr_Icmss_Ndestac Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Icmss_Ndestac * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Docto_Rec) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Docto_Rec), 1, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    If p_Dat_Pgto_Gnre_Darj Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Dat_Pgto_Gnre_Darj, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Vlr_Custo_Unit Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Custo_Unit * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Quantidade_Conv Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Quantidade_Conv * 1000000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Fecp_Icms Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Fecp_Icms * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Fecp_Difaliq Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Fecp_Difaliq * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Fecp_Icms_St Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Fecp_Icms_St * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Fecp_Fonte Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Fecp_Fonte * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    /* TRIB_ICMSS_AUX2 E BASE_ICMSS_AUX2 */
    Linha_w := Linha_w || Nvl(Saf.Trib_Icmss_Aux2, '@') || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Icmss_Aux2, Rpad('@', 17, ' ')) || Tab;

    /* ------------------------- OS 1844 ------------------------- */
    If p_Vlr_Base_Icmss_n_Escrit Is Not Null Then
      Linha_w := Linha_w || Lpad(Nvl(To_Char(p_Vlr_Base_Icmss_n_Escrit * 100),
                                     Rpad('@', 17)),
                                 17,
                                 '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;
    If p_Vlr_Icmss_n_Escrit Is Not Null Then
      Linha_w := Linha_w || Lpad(Nvl(To_Char(p_Vlr_Icmss_n_Escrit * 100),
                                     Rpad('@', 17)),
                                 17,
                                 '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;
    -- OS 2020
    If Ltrim(p_Cod_Trib_Ipi) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Trib_Ipi), 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If Ltrim(p_Lote_Medicamento) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Lote_Medicamento), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If p_Valid_Medicamento Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Valid_Medicamento, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Base_Medicamento) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Base_Medicamento), 1, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    If p_Vlr_Preco_Medicamento Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Preco_Medicamento * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Tipo_Arma) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Tipo_Arma), 1, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    If Ltrim(p_Num_Serie_Arma) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Serie_Arma), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If Ltrim(p_Num_Cano_Arma) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Cano_Arma), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If Ltrim(p_Dsc_Arma) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Dsc_Arma), 100, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 100, ' ') || Tab;
    End If;

    If p_Ident_Observacao Is Not Null Then
      Begin
        Select Cod_Observacao
          Into Cod_Observacao_w
          From X2009_Observacao
         Where Ident_Observacao = p_Ident_Observacao;

        If Ltrim(Cod_Observacao_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Observacao_w), 8, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60009;
          Chave_w    := p_Ident_Observacao;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    -- OS2191 -----------------
    -- COD_EX_NCM
    If Ltrim(p_Cod_Ex_Ncm) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Ex_Ncm), 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    -- COD_EX_IMP
    If Ltrim(p_Cod_Ex_Imp) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Ex_Imp), 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    -- CNPJ_OPERADORA
    If Ltrim(p_Cnpj_Operadora) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cnpj_Operadora), 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    -- CPF_OPERADORA
    If Ltrim(p_Cpf_Operadora) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cpf_Operadora), 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    -- UF_OPERADORA
    If p_Ident_Uf_Operadora Is Not Null Then
      Begin
        Select Cod_Estado
          Into Uf_Operadora_w
          From Estado
         Where Ident_Estado = p_Ident_Uf_Operadora;

        If Ltrim(Uf_Operadora_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Uf_Operadora_w), 2, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
        End If;

      Exception
        When Others Then
          -- Erro no acesso a tabela ESTADO
          Cod_Erro_w := 60102;
          Chave_w    := p_Ident_Uf_Operadora;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    -- INS_EST_OPERADORA
    If Ltrim(p_Ins_Est_Operadora) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ins_Est_Operadora), 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    -- IND_ESPECIF_RECEITA
    If Ltrim(p_Ind_Especif_Receita) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Especif_Receita), 1, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    -- COD_CLASS_ITEM
    If Ltrim(p_Cod_Class_Item) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Class_Item), 4, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
    End If;

    --VLR_TERCEIROS
    If p_Vlr_Terceiros Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Terceiros * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    --VLR_PRECO_SUGER
    If p_Vlr_Preco_Suger Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Preco_Suger * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    /* INICIO - OS 2302  */
    If p_Vlr_Base_Cide Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Base_Cide * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Cide Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Aliq_Cide * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    -- ÚLTIMO CAMPO - SEM TAB
    If p_Vlr_Cide Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Cide * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    /*OS2315*/
    If Ltrim(p_Cod_Oper_Esp_St) Is Not Null Then
      Linha_w := Linha_w || p_Cod_Oper_Esp_St || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If p_Vlr_Comissao Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Comissao * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Icms_Frete Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Icms_Frete * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Difal_Frete Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Difal_Frete * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- ÚLTIMO CAMPO - SEM TAB
    If Ltrim(p_Ind_Vlr_Pis_Cofins) Is Not Null Then
      -- OS2386
      Linha_w := Linha_w || p_Ind_Vlr_Pis_Cofins || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(p_Cod_Enquad_Ipi) Is Not Null Then
      -- OS2388-B
      Linha_w := Linha_w || p_Cod_Enquad_Ipi || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(p_Cod_Situacao_Pis) Is Not Null Then
      -- OS2388-B
      Linha_w := Linha_w || Lpad(To_Char(p_Cod_Situacao_Pis), 2, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If Ltrim(p_Qtd_Base_Pis) Is Not Null Then
      -- OS2388-B
      Linha_w := Linha_w || Lpad(To_Char(p_Qtd_Base_Pis * 1000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Vlr_Aliq_Pis_r) Is Not Null Then
      -- OS2388-B

      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Aliq_Pis_r * 10000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Situacao_Cofins) Is Not Null Then
      -- OS2388-B
      Linha_w := Linha_w || Lpad(To_Char(p_Cod_Situacao_Cofins), 2, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If Ltrim(p_Qtd_Base_Cofins) Is Not Null Then
      -- OS2388-B
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Qtd_Base_Cofins * 1000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;
    -- ÚLTIMO CAMPO - SEM TAB
    If Ltrim(p_Vlr_Aliq_Cofins_r) Is Not Null Then
      -- OS2388-B
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Aliq_Cofins_r * 10000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Item_Port_Tare) Is Not Null Then
      -- OS2479
      Linha_w := Linha_w || Rpad(Ltrim(p_Item_Port_Tare), 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If Ltrim(p_Vlr_Funrural) Is Not Null Then
      -- OS2533
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Funrural * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- OS2388-Pdw
    If Ltrim(p_Ind_Tp_Prod_Medic) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Tp_Prod_Medic), 1, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    -- OS2933-B
    If Ltrim(p_Vlr_Custo_Dca) Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Custo_Dca * 1000000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- OS2933-B
    If Ltrim(p_Cod_Tp_Lancto) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Cod_Tp_Lancto), 6, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
    End If;

    -- OS2933-B
    If Ltrim(p_Vlr_Perc_Cred_Out) Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Perc_Cred_Out * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    -- OS2933-B
    If Ltrim(p_Vlr_Cred_Out) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Cred_Out * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- OS2933-B
    If Ltrim(p_Vlr_ICMS_Dca) Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_ICMS_Dca * 1000000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    --OS2388-B2
    If Ltrim(p_Vlr_PIS_Exp) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_PIS_Exp * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    --OS2388-B2
    If Ltrim(p_Vlr_PIS_Trib) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_PIS_Trib * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    --OS2388-B2
    If Ltrim(p_Vlr_PIS_N_Trib) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_PIS_N_Trib * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    --OS2388-B2
    If Ltrim(p_Vlr_Cofins_Exp) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Cofins_Exp * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    --OS2388-B2
    If Ltrim(p_Vlr_Cofins_Trib) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Cofins_Trib * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    --OS2388-B2
    If Ltrim(p_Vlr_Cofins_N_Trib) Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Cofins_N_Trib * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- OS2933-B1 - ÚLTIMO CAMPO - SEM TAB
    If Ltrim(p_Cod_Enq_Legal) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Cod_Enq_Legal), 4, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
    End If;

    If P_DAT_LANC_PIS_COFINS Is Not Null Then
      Linha_w := Linha_w || To_Char(P_DAT_LANC_PIS_COFINS, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(P_IND_PIS_COFINS_EXTEMP) Is Not Null Then
      Linha_w := Linha_w || P_IND_PIS_COFINS_EXTEMP || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(P_IND_NATUREZA_FRETE) Is Not Null Then
      Linha_w := Linha_w || P_IND_NATUREZA_FRETE || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(P_COD_NAT_REC) Is Not Null Then
      -- OS3169-DW11
      Linha_w := Linha_w || Lpad(To_Char(P_COD_NAT_REC), 3, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    End If;

    If Ltrim(P_IND_NAT_BASE_CRED) Is Not Null Then
      -- OS3169-GE13B
      Linha_w := Linha_w || P_IND_NAT_BASE_CRED || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(P_VLR_ACRESCIMO) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_ACRESCIMO * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(Saf.IND_IPI_NDESTAC_DF) Is Not Null Then
      Linha_w := Linha_w || Saf.IND_IPI_NDESTAC_DF || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    -- OS3521
    If Ltrim(P_DSC_RESERVADO1) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_DSC_RESERVADO1), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If Ltrim(P_DSC_RESERVADO2) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_DSC_RESERVADO2), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If Ltrim(P_DSC_RESERVADO3) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_DSC_RESERVADO3), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If Ltrim(P_COD_TRIB_PROD) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_COD_TRIB_PROD), 4, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
    End If;

    If Ltrim(P_DSC_RESERVADO4) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_DSC_RESERVADO4), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If Ltrim(P_DSC_RESERVADO5) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_DSC_RESERVADO5), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If P_DSC_RESERVADO6 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_DSC_RESERVADO6 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_DSC_RESERVADO7 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_DSC_RESERVADO7 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_DSC_RESERVADO8 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_DSC_RESERVADO8 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_INDICE_PROD_ACAB Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_INDICE_PROD_ACAB), 3, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    End If;

    If Ltrim(P_VLR_BASE_DIA_AM) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_BASE_DIA_AM * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(P_VLR_ALIQ_DIA_AM) Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_ALIQ_DIA_AM * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If Ltrim(P_VLR_ICMS_DIA_AM) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_ICMS_DIA_AM * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(P_VLR_ADUANEIRO) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_ADUANEIRO * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Situacao_Pis_ST) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Cod_Situacao_Pis_ST), 2, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Situacao_Cofins_ST) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Cod_Situacao_Cofins_ST), 2, '0') || TAB;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || TAB;
    End If;

    If Ltrim(P_VLR_ALIQ_DCIP) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_ALIQ_DCIP * 10000), 7, '0') || TAB;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || TAB;
    End If;

    If Ltrim(P_NUM_LI) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_NUM_LI), 10, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
    End If;

    --MFS2101
    If P_VLR_FCP_UF_DEST Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_FCP_UF_DEST * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_ICMS_UF_DEST Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_ICMS_UF_DEST * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    /*ÚLTIMO CAMPO */ --MFS2101

    If P_VLR_ICMS_UF_ORIG Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_ICMS_UF_ORIG * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- MFS 3484

    If P_VLR_DIF_DUB Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_DIF_DUB * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- MFS 4881

    If P_VLR_ICMS_NAO_DEST Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_ICMS_NAO_DEST * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_BASE_ICMS_NAO_DEST Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_BASE_ICMS_NAO_DEST * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_ALIQ_ICMS_NAO_DEST Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_ALIQ_ICMS_NAO_DEST * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If P_IND_MOTIVO_RES Is Not Null Then
      Linha_w := Linha_w || P_IND_MOTIVO_RES || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(P_NUM_DOCFIS_RET) Is Not Null Then
      Linha_w := Linha_w || Rpad(To_Char(P_NUM_DOCFIS_RET), 12, ' ') || TAB;
    Else
      Linha_w := Linha_w || Rpad('@', 12, ' ') || TAB;
    End If;

    If Ltrim(P_SERIE_DOCFIS_RET) Is Not Null Then
      Linha_w := Linha_w || Rpad(To_Char(P_SERIE_DOCFIS_RET), 3, ' ') || TAB;
    Else
      Linha_w := Linha_w || Rpad('@', 3, ' ') || TAB;
    End If;

    If Ltrim(P_NUM_AUTENTIC_NFE_RET) Is Not Null Then
      Linha_w := Linha_w || Rpad(To_Char(P_NUM_AUTENTIC_NFE_RET), 80, ' ') || TAB;
    Else
      Linha_w := Linha_w || Rpad('@', 80, ' ') || TAB;
    End If;

    If P_NUM_ITEM_RET Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_NUM_ITEM_RET), 5, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
    End If;

    If P_IDENT_FIS_JUR_RET Is Not Null Then

      Begin
        Select Cod_Fis_Jur, Ind_Fis_Jur
          Into Cod_Fis_Jur_w, Ind_Fis_Jur_w
          From X04_Pessoa_Fis_Jur
         Where Ident_Fis_Jur = P_IDENT_FIS_JUR_RET;

        If Ltrim(Ind_Fis_Jur_w) Is Not Null Then
          Linha_w := Linha_w || Ind_Fis_Jur_w || Tab;
        Else
          Linha_w := Linha_w || '@' || Tab;
        End If;

        If Ltrim(Cod_Fis_Jur_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Fis_Jur_w), 14, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60104;
          Chave_w    := p_Ident_Fis_Jur;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;

    ELSE
      Linha_w := Linha_w || '@' || Tab;
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If P_IND_TP_DOC_ARREC Is Not Null Then
      Linha_w := Linha_w || P_IND_TP_DOC_ARREC || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(P_NUM_DOC_ARREC) Is Not Null Then
      Linha_w := Linha_w || Rpad(To_Char(P_NUM_DOC_ARREC), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If P_IDENT_CFO_DCIP Is Not Null Then
      Begin
        SELECT COD_CFO
          INTO cod_cfo_dcip_w
          FROM X2012_COD_FISCAL
         WHERE IDENT_CFO = P_IDENT_CFO_DCIP;

        If Ltrim(cod_cfo_dcip_w) Is Not Null Then
          Linha_w := Linha_w || cod_cfo_dcip_w || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60012;
          Chave_w    := P_IDENT_CFO_DCIP;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    ELSE
      Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
    End If;

    If P_VLR_BASE_INSS Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_BASE_INSS * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_INSS_RETIDO Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_INSS_RETIDO * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_TOT_ADIC Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_TOT_ADIC * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_N_RET_PRINC Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_N_RET_PRINC * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_N_RET_ADIC Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_N_RET_ADIC * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_ALIQ_INSS Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_ALIQ_INSS * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If P_VLR_RET_SERV Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_RET_SERV * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_SERV_15 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_SERV_15 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_SERV_20 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_SERV_20 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_SERV_25 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_SERV_25 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_IND_TP_PROC_ADJ_PRINC Is Not Null Then
      Linha_w := Linha_w || P_IND_TP_PROC_ADJ_PRINC || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If P_IND_TP_PROC_ADJ_PRINC IN ('1', '2') Then
      If P_IDENT_PROC_ADJ_PRINC Is Not Null Then
        Begin
          Select num_proc_adj
            Into num_proc_adj_princ_w
            From X2058_PROC_ADJ
           Where ident_proc_adj = P_IDENT_PROC_ADJ_PRINC;

          If Ltrim(num_proc_adj_princ_w) Is Not Null Then
            Linha_w := Linha_w ||
                       Rpad(Ltrim(num_proc_adj_princ_w), 21, ' ') || Tab;
          Else
            Linha_w := Linha_w || Rpad('@', 21, ' ') || Tab;
          End If;

        Exception
          When Others Then
            Cod_Erro_w := 92956;
            Chave_w    := P_IDENT_PROC_ADJ_PRINC;
            Msg_Erro_w := Substr(Sqlerrm, 1, 200);
            Raise Erro_Leitura;
        End;
      Else
        Linha_w := Linha_w || Rpad('@', 21, ' ') || Tab;
      End If;

    ElsIf P_IND_TP_PROC_ADJ_PRINC = '3' Then
      If P_NUM_PROC_ADJ_ADIC Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(P_NUM_PROC_ADJ_PRINC), 21, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 21, ' ') || Tab;
      End If;
    Else
      Linha_w := Linha_w || Rpad('@', 21, ' ') || Tab;
    End If;

    If P_IND_TP_PROC_ADJ_PRINC IN ('1', '2') Then
      If P_IDENT_SUSP_TBT_PRINC Is Not Null Then
        Begin
          Select cod_susp
            Into cod_susp_princ_w
            From X2059_SUSP_TBT
           Where ident_susp_tbt = P_IDENT_SUSP_TBT_PRINC;

          If Ltrim(cod_susp_princ_w) Is Not Null Then
            Linha_w := Linha_w || Rpad(Ltrim(cod_susp_princ_w), 14, ' ') || Tab;
          Else
            Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
          End If;

        Exception
          When Others Then
            Cod_Erro_w := 92957;
            Chave_w    := P_IDENT_SUSP_TBT_PRINC;
            Msg_Erro_w := Substr(Sqlerrm, 1, 200);
            Raise Erro_Leitura;
        End;
      Else
        Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
      End If;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If P_IND_TP_PROC_ADJ_ADIC Is Not Null Then
      Linha_w := Linha_w || P_IND_TP_PROC_ADJ_ADIC || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If P_IND_TP_PROC_ADJ_ADIC In ('1', '2') Then
      If P_IDENT_PROC_ADJ_ADIC Is Not Null Then
        Begin
          Select num_proc_adj
            Into num_proc_adj_adic_w
            From X2058_PROC_ADJ
           Where ident_proc_adj = p_ident_proc_adj_adic;

          If Ltrim(num_proc_adj_adic_w) Is Not Null Then
            Linha_w := Linha_w || Rpad(Ltrim(num_proc_adj_adic_w), 21, ' ') || Tab;
          Else
            Linha_w := Linha_w || Rpad('@', 21, ' ') || Tab;
          End If;

        Exception
          When Others Then
            Cod_Erro_w := 92956;
            Chave_w    := P_IDENT_PROC_ADJ_ADIC;
            Msg_Erro_w := Substr(Sqlerrm, 1, 200);
            Raise Erro_Leitura;
        End;
      Else
        Linha_w := Linha_w || Rpad('@', 21, ' ') || Tab;
      End If;

    ElsIf P_IND_TP_PROC_ADJ_ADIC = '3' Then
      If P_NUM_PROC_ADJ_ADIC Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(P_NUM_PROC_ADJ_ADIC), 21, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 21, ' ') || Tab;
      End If;
    Else
      Linha_w := Linha_w || Rpad('@', 21, ' ') || Tab;
    End If;

    If P_IND_TP_PROC_ADJ_ADIC In ('1', '2') Then
      If P_IDENT_SUSP_TBT_ADIC Is Not Null Then
        Begin
          Select cod_susp
            Into cod_susp_adic_w
            From X2059_SUSP_TBT
           Where ident_susp_tbt = p_ident_susp_tbt_adic;

          If Ltrim(cod_susp_adic_w) Is Not Null Then
            Linha_w := Linha_w || Rpad(Ltrim(cod_susp_adic_w), 14, ' ') || Tab;
          Else
            Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
          End If;

        Exception
          When Others Then
            Cod_Erro_w := 92957;
            Chave_w    := P_IDENT_SUSP_TBT_ADIC;
            Msg_Erro_w := Substr(Sqlerrm, 1, 200);
            Raise Erro_Leitura;
        End;
      Else
        Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
      End If;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    -- ULTIMO CAMPO
    --I.MFS20985
    If P_VLR_IPI_DEV Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_IPI_DEV * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_COD_BENEFICIO Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_COD_BENEFICIO), 10, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
    End If;

    If P_VLR_ABAT_NTRIBUTADO Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_ABAT_NTRIBUTADO * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_CREDITO_MVA_SN Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_CREDITO_MVA_SN * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_DESONERADO_ICMS Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_DESONERADO_ICMS * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_DIFERIDO_ICMS Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_DIFERIDO_ICMS * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_EXC_BC_PIS Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_EXC_BC_PIS * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_EXC_BC_COFINS Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_EXC_BC_COFINS * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    --MFS40783
    If Ltrim(P_COD_CSOSN) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_COD_CSOSN), 3, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    End If;

    If P_VLR_FECP_ALIQ_ICMS Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_FECP_ALIQ_ICMS * 10000), 7, '0');
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ');
    End If;

    Return Linha_w;

  End;

  Function X09(p_Cod_Empresa           IN Varchar2,
               p_Cod_Estab             IN Varchar2,
               p_Data_Fiscal           IN DATE,
               p_Movto_e_s             IN VARCHAR2,
               p_Norm_Dev              IN VARCHAR2,
               p_Ident_Docto           IN Number,
               p_Ident_Fis_Jur         IN Number,
               p_Num_Docfis            IN Varchar2,
               p_Serie_Docfis          IN Varchar2,
               p_Sub_Serie_Docfis      IN Varchar2,
               p_Ident_Servico         IN Number,
               p_Num_Item              IN Number,
               p_Descricao_Compl       IN Varchar2,
               p_Ident_Cfo             IN Number,
               p_Ident_Natureza_Op     IN Number,
               p_Quantidade            IN Number,
               p_Vlr_Unit              IN Number,
               p_Vlr_Servico           IN Number,
               p_Vlr_Desconto          IN Number,
               p_Vlr_Tot               IN Number,
               p_Contrato              IN Varchar2,
               p_Cod_Indice            IN Varchar2,
               p_Vlr_Servico_Conv      IN Number,
               p_Num_Processo          IN Number,
               p_Ind_Gravacao          IN VARCHAR2,
               p_Ident_Produto         IN Number,
               p_Dat_Operacao          IN DATE,
               p_Usuario               IN Varchar2,
               p_Compl_Isencao         IN Varchar2,
               p_Vlr_Base_Csll         IN Number,
               p_Vlr_Aliq_Csll         IN Number,
               p_Vlr_Csll              IN Number,
               p_Vlr_Base_Pis          IN Number,
               p_Vlr_Aliq_Pis          IN Number,
               p_Vlr_Pis               IN Number,
               p_Vlr_Base_Cofins       IN Number,
               p_Vlr_Aliq_Cofins       IN Number,
               p_Vlr_Cofins            IN Number,
               p_Ident_Conta           IN Number,
               p_ident_observacao      IN Number,
               p_cod_trib_iss          IN Varchar2,
               p_vlr_mat_prop          IN Number,
               p_vlr_mat_terc          IN Number,
               p_VLR_BASE_ISS_RETIDO   IN Number,
               p_VLR_ISS_RETIDO        IN Number,
               p_VLR_DEDUCAO_ISS       IN Number,
               p_VLR_SUBEMPR_ISS       IN Number,
               p_COD_CFPS              IN Varchar2,
               p_VLR_OUT_DESP          IN Number,
               p_VLR_BASE_CIDE         IN Number,
               p_VLR_ALIQ_CIDE         IN Number,
               p_VLR_CIDE              IN Number,
               p_VLR_COMISSAO          IN Number,
               p_IND_VLR_PIS_COFINS    IN VARCHAR2,
               p_COD_SITUACAO_PIS      IN Number,
               p_COD_SITUACAO_COFINS   IN Number,
               p_VLR_PIS_EXP           IN Number,
               p_VLR_PIS_TRIB          IN Number,
               p_VLR_PIS_N_TRIB        IN Number,
               p_VLR_COFINS_EXP        IN Number,
               p_VLR_COFINS_TRIB       IN Number,
               p_VLR_COFINS_N_TRIB     IN Number,
               p_VLR_PIS_RETIDO        IN Number, -- 3169-DW1
               p_VLR_COFINS_RETIDO     IN Number, -- 3169-DW1
               p_DAT_LANC_PIS_COFINS   IN DATE, -- 3169-DW1
               p_IND_PIS_COFINS_EXTEMP IN VARCHAR2, -- 3169-DW1
               p_IND_LOCAL_EXEC_SERV   IN VARCHAR2, -- 3169-DW1
               p_IDENT_CUSTO           IN Number, -- 3169-DW1
               p_VLR_BASE_INSS         IN Number, -- 3003
               p_VLR_ALIQ_INSS         IN Number, -- 3003
               p_VLR_INSS_RETIDO       IN Number, -- 3003
               P_COD_NAT_REC           IN NUMBER, -- 3169-DW11
               P_IND_NAT_BASE_CRED     IN Varchar2, -- 3169-GE13B
               P_VLR_ACRESCIMO         IN NUMBER,
               P_DSC_RESERVADO1        IN VARCHAR2, --3521
               P_DSC_RESERVADO2        IN VARCHAR2, --3521
               P_DSC_RESERVADO3        IN VARCHAR2, --3521
               P_IDENT_NBS             IN NUMBER, -- OS3924

               P_VLR_TOT_ADIC          IN NUMBER, -- OS4514
               P_VLR_TOT_RET           IN NUMBER, -- OS4514
               P_VLR_DEDUCAO_NF        IN NUMBER, -- OS4514
               P_VLR_RET_NF            IN NUMBER, -- OS4514
               P_VLR_RET_SERV          IN NUMBER, -- OS4514
               P_VLR_ALIQ_ISS_RETIDO   IN NUMBER, -- OS4226,
               P_COD_SIT_TRIB_ISS      IN VARCHAR2, -- OS4655
               P_VLR_N_RET_PRINC       IN NUMBER,
               P_VLR_N_RET_ADIC        IN NUMBER,
               P_VLR_DED_ALIM          IN NUMBER,
               P_VLR_DED_TRANS         IN NUMBER,
               P_IND_TP_PROC_ADJ_PRINC IN VARCHAR2, -- MFS10357
               P_IDENT_PROC_ADJ_PRINC  IN NUMBER,
               P_IDENT_SUSP_TBT_PRINC  IN NUMBER,
               P_IND_TP_PROC_ADJ_ADIC  IN VARCHAR2,
               P_IDENT_PROC_ADJ_ADIC   IN NUMBER,
               P_IDENT_SUSP_TBT_ADIC   IN NUMBER,
               P_VLR_SERV_15           IN NUMBER,
               P_VLR_SERV_20           IN NUMBER,
               P_VLR_SERV_25           IN NUMBER,
               P_VLR_ABAT_NTRIBUTADO   IN NUMBER, --MFS20985
               P_COD_ATIV_RJ           IN NUMBER, --MFS31367
               P_DSC_RESERVADO4        IN VARCHAR2,
               P_DSC_RESERVADO5        IN VARCHAR2,
               P_DSC_RESERVADO6        IN NUMBER,
               P_DSC_RESERVADO7        IN NUMBER,
               P_DSC_RESERVADO8        IN NUMBER

               )

   Return Long Is
    Linha_w Long;

    /* DECLARACAO DE TIPOS */
    Type Tp_Trib_Base Is Record(
      Vlr_Aliq_Icms Safx09.Vlr_Aliq_Icms%Type,
      Vlr_Icms      Safx09.Vlr_Icms%Type,
      Dif_Aliq_Icms Safx09.Dif_Aliq_Icms%Type,
      Obs_Icms      Safx09.Obs_Icms%Type,
      Cod_Apur_Icms Safx09.Cod_Apur_Icms%Type,
      Vlr_Aliq_Ir   Safx09.Vlr_Aliq_Ir%Type,
      Vlr_Ir        Safx09.Vlr_Ir%Type,
      Vlr_Aliq_Iss  Safx09.Vlr_Aliq_Iss%Type,
      Vlr_Iss       Safx09.Vlr_Iss%Type,
      Trib_Icms     Safx09.Trib_Icms%Type,
      Base_Icms     Safx09.Base_Icms%Type,
      Trib_Ir       Safx09.Trib_Ir%Type,
      Base_Ir       Safx09.Base_Ir%Type,
      Trib_Iss      Safx09.Trib_Iss%Type,
      Base_Iss      Safx09.Base_Iss%Type);

    /* VARIAVEIS DE TRABALHO */
    Saf                 Tp_Trib_Base;
    Tab                 Varchar2(20) := CHR(9);
    Cod_Fis_Jur_w       Safx09.Cod_Fis_Jur%Type;
    Ind_Fis_Jur_w       Safx09.Ind_Fis_Jur%Type;
    Cod_Docto_w         Safx09.Cod_Docto%Type;
    Cod_Servico_w       Safx09.Cod_Servico%Type;
    Cod_Cfo_w           Safx09.Cod_Cfo%Type;
    Cod_Natureza_Op_w   Safx09.Cod_Natureza_Op%Type;
    Cod_Produto_w       Safx09.Cod_Produto%Type;
    Ind_Produto_w       Safx09.Ind_Produto%Type;
    Cod_Conta_w         Safx09.Cod_Conta%Type;
    Cod_Observacao_w    Safx09.Cod_Observacao%Type;
    Cod_Custo_w         Safx09.Cod_Custo%Type;
    COD_NBS_W           SAFX09.COD_NBS%TYPE;
    NUM_PROC_ADJ_W      SAFX2058.NUM_PROC_ADJ%TYPE;
    COD_SUSP_W          SAFX2059.COD_SUSP%TYPE;
    NUM_PROC_ADJ_ADIC_W SAFX2058.NUM_PROC_ADJ%TYPE;
    COD_SUSP_ADIC_W     SAFX2059.COD_SUSP%TYPE;

    /* VARIAVEIS DE TRATAMENTO DE ERRO */
    Chave_w    Log_Det_Proc.Mens_Erro%Type;
    Cod_Erro_w Log_Det_Proc.Cod_Erro%Type;
    Erro_Leitura Exception;
    Msg_Erro_w Varchar2(200);

    Procedure Rec_Trib_Base(p_Num_Item      In Number,
                            p_Ident_Servico In Number,
                            p_Sub_Serie     In Varchar2,
                            p_Serie         In Varchar2,
                            p_Numdoc        In Varchar2,
                            p_Ident_Fis_Jur In Number,
                            p_Ident_Docto   In Number,
                            p_Norm_Dev      IN VARCHAR2,
                            p_Movto_e_s     IN VARCHAR2,
                            p_Data_Fiscal   In Date,
                            p_Cod_Estab     In Varchar2,
                            p_Cod_Empresa   In Varchar2) Is

      Rnulo           Tp_Trib_Base;
      Cod_Oper_Apur_w Detalhe_Operacao.Cod_Oper_Apur%Type;

    Begin
      Saf     := Rnulo;
      Chave_w := p_Cod_Empresa || ' - ' || p_Cod_Estab || ' - ' ||
                 p_Data_Fiscal || ' - ' || p_Movto_e_s || ' - ' ||
                 p_Norm_Dev || ' - ' || p_Ident_Docto || ' - ' ||
                 p_Ident_Fis_Jur || ' - ' || p_Numdoc || ' - ' || p_Serie ||
                 ' - ' || p_Sub_Serie || ' - ' || p_Ident_Servico || ' - ' ||
                 p_Num_Item;

      /* ----------------- RECUPERA TRIBUTOS -------------------------- */
      For Rt In (Select *
                   From X09_Trib_Serv
                  Where Num_Item = p_Num_Item
                    And Ident_Servico = p_Ident_Servico
                    And Sub_Serie_Docfis = p_Sub_Serie
                    And Serie_Docfis = p_Serie
                    And Num_Docfis = p_Numdoc
                    And Ident_Fis_Jur = p_Ident_Fis_Jur
                    And Ident_Docto = p_Ident_Docto
                    And Norm_Dev = p_Norm_Dev
                    And Movto_e_s = p_Movto_e_s
                    And Data_Fiscal = p_Data_Fiscal
                    And Cod_Estab = p_Cod_Estab
                    And Cod_Empresa = p_Cod_Empresa) Loop
        Begin
          Cod_Oper_Apur_w := Null;
          If Rt.Ident_Det_Operacao Is Not Null Then
            Begin
              Select Cod_Oper_Apur
                Into Cod_Oper_Apur_w
                From Detalhe_Operacao
               Where Ident_Det_Operacao = Rt.Ident_Det_Operacao;
            Exception
              When No_Data_Found Then
                Cod_Oper_Apur_w := Null;
            End;
          End If;

          If Rt.Cod_Tributo = 'ICMS' Then
            If Rt.Aliq_Tributo Is Not Null Then
              Saf.Vlr_Aliq_Icms := Lpad(To_Char(Rt.Aliq_Tributo * 10000),
                                        7,
                                        '0');
            End If;
            If Rt.Vlr_Tributo Is Not Null Then
              Saf.Vlr_Icms := Lpad(To_Char(Rt.Vlr_Tributo * 100), 17, '0');
            End If;
            If Rt.Dif_Aliq_Tributo Is Not Null Then
              Saf.Dif_Aliq_Icms := Lpad(To_Char(Rt.Dif_Aliq_Tributo * 10000),
                                        7,
                                        '0');
            End If;
            Saf.Obs_Icms      := Rpad(Ltrim(Rt.Obs_Tributo), 45, ' ');
            Saf.Cod_Apur_Icms := Rpad(Ltrim(Cod_Oper_Apur_w), 5, ' ');
          Elsif Rt.Cod_Tributo = 'IR' Then
            If Rt.Aliq_Tributo Is Not Null Then
              Saf.Vlr_Aliq_Ir := Lpad(To_Char(Rt.Aliq_Tributo * 10000),
                                      7,
                                      '0');
            End If;
            If Rt.Vlr_Tributo Is Not Null Then
              Saf.Vlr_Ir := Lpad(To_Char(Rt.Vlr_Tributo * 100), 17, '0');
            End If;
          Elsif Rt.Cod_Tributo = 'ISS' Then
            If Rt.Aliq_Tributo Is Not Null Then
              Saf.Vlr_Aliq_Iss := Lpad(To_Char(Rt.Aliq_Tributo * 10000),
                                       7,
                                       '0');
            End If;
            If Rt.Vlr_Tributo Is Not Null Then
              Saf.Vlr_Iss := Lpad(To_Char(Rt.Vlr_Tributo * 100), 17, '0');
            End If;
          End If;

        Exception
          When Others Then
            Cod_Erro_w := 60109;
            Msg_Erro_w := Substr(Sqlerrm, 1, 200);
            Raise Erro_Leitura;
        End;
      End Loop; -- FIM LOOP TRIBUTOS

      /* ----------------------  RECUPERA BASES ---------------------------- */
      For Rb In (Select *
                   From X09_Base_Serv
                  Where Num_Item = p_Num_Item
                    And Ident_Servico = p_Ident_Servico
                    And Sub_Serie_Docfis = p_Sub_Serie
                    And Serie_Docfis = p_Serie
                    And Num_Docfis = p_Numdoc
                    And Ident_Fis_Jur = p_Ident_Fis_Jur
                    And Ident_Docto = p_Ident_Docto
                    And Norm_Dev = p_Norm_Dev
                    And Movto_e_s = p_Movto_e_s
                    And Data_Fiscal = p_Data_Fiscal
                    And Cod_Estab = p_Cod_Estab
                    And Cod_Empresa = p_Cod_Empresa) Loop
        Begin
          If Rb.Vlr_Base Is Not Null Then
            If Rb.Cod_Tributo = 'ICMS' Then
              Saf.Trib_Icms := To_Char(Rb.Cod_Tributacao);
              Saf.Base_Icms := Lpad(To_Char(Rb.Vlr_Base * 100), 17, '0');
            Elsif Rb.Cod_Tributo = 'IR' Then
              Saf.Trib_Ir := To_Char(Rb.Cod_Tributacao);
              Saf.Base_Ir := Lpad(To_Char(Rb.Vlr_Base * 100), 17, '0');
            Elsif Rb.Cod_Tributo = 'ISS' Then
              Saf.Trib_Iss := To_Char(Rb.Cod_Tributacao);
              Saf.Base_Iss := Lpad(To_Char(Rb.Vlr_Base * 100), 17, '0');
            End If;
          End If;

        Exception
          When Others Then
            Cod_Erro_w := 60110;
            Msg_Erro_w := Substr(Sqlerrm, 1, 200);
            Raise Erro_Leitura;
        End;
      End Loop; -- FIM LOOP BASES
    End Rec_Trib_Base;

  Begin

    If Ltrim(p_Cod_Empresa) Is Not Null Then
      Linha_w := Rpad(Ltrim(p_Cod_Empresa), 3, ' ') || Tab;
    Else
      Linha_w := Rpad('@', 3, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Estab) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Estab), 6, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
    End If;

    If Ltrim(p_Data_Fiscal) Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Data_Fiscal, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(p_Movto_e_s) Is Not Null Then
      Linha_w := Linha_w || p_Movto_e_s || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(p_Norm_Dev) Is Not Null Then
      Linha_w := Linha_w || p_Norm_Dev || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    Begin
      Select Cod_Docto
        Into Cod_Docto_w
        From X2005_Tipo_Docto
       Where Ident_Docto = p_Ident_Docto;

      If Ltrim(Cod_Docto_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Docto_w), 5, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60005;
        Chave_w    := p_Ident_Docto;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    Begin
      Select Ind_Fis_Jur, Cod_Fis_Jur
        Into Ind_Fis_Jur_w, Cod_Fis_Jur_w
        From X04_Pessoa_Fis_Jur
       Where Ident_Fis_Jur = p_Ident_Fis_Jur;

      If Ltrim(Ind_Fis_Jur_w) Is Not Null Then
        Linha_w := Linha_w || Ind_Fis_Jur_w || Tab;
      Else
        Linha_w := Linha_w || '@' || Tab;
      End If;

      If Ltrim(Cod_Fis_Jur_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Fis_Jur_w), 14, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60104;
        Chave_w    := p_Ident_Fis_Jur;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    If Ltrim(p_Num_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Docfis), 12, ' ') || Tab;
    End If;

    If Ltrim(p_Serie_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Serie_Docfis), 3, ' ') || Tab;
    End If;

    If Ltrim(p_Sub_Serie_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Sub_Serie_Docfis), 2, ' ') || Tab;
    End If;

    Begin
      Select Cod_Servico
        Into Cod_Servico_w
        From X2018_Servicos
       Where Ident_Servico = p_Ident_Servico;

      If Ltrim(Cod_Servico_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Servico_w), 4, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60018;
        Chave_w    := p_Ident_Servico;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    Linha_w := Linha_w || Lpad(To_Char(p_Num_Item), 5, '0') || Tab;

    If p_Vlr_Servico Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Servico * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Tot Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Tot * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Descricao_Compl) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Descricao_Compl), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If p_Ident_Cfo Is Not Null Then
      Begin
        Select Cod_Cfo
          Into Cod_Cfo_w
          From X2012_Cod_Fiscal
         Where Ident_Cfo = p_Ident_Cfo;

        If Ltrim(Cod_Cfo_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Cfo_w), 4, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60012;
          Chave_w    := p_Ident_Cfo;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
    End If;

    If p_Ident_Natureza_Op Is Not Null Then
      Begin
        Select Cod_Natureza_Op
          Into Cod_Natureza_Op_w
          From X2006_Natureza_Op
         Where Ident_Natureza_Op = p_Ident_Natureza_Op;

        If Ltrim(Cod_Natureza_Op_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Natureza_Op_w), 3, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60006;
          Chave_w    := p_Ident_Natureza_Op;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    End If;

    If p_Quantidade Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Quantidade * 1000000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Unit Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Unit * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Desconto Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Desconto * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Contrato) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Contrato), 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Indice) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Indice), 10, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
    End If;

    If p_Vlr_Servico_Conv Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Servico_Conv * 10000), 18, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 18, ' ') || Tab;
    End If;

    Rec_Trib_Base(p_Num_Item,
                  p_Ident_Servico,
                  p_Sub_Serie_Docfis,
                  p_Serie_Docfis,
                  p_Num_Docfis,
                  p_Ident_Fis_Jur,
                  p_Ident_Docto,
                  p_Norm_Dev,
                  p_Movto_e_s,
                  p_Data_Fiscal,
                  p_Cod_Estab,
                  p_Cod_Empresa);

    Linha_w := Linha_w || Nvl(Saf.Vlr_Aliq_Icms, Rpad('@', 7, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Icms, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Dif_Aliq_Icms, Rpad('@', 7, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Obs_Icms, Rpad('@', 45, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Cod_Apur_Icms, Rpad('@', 5, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Aliq_Ir, Rpad('@', 7, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Ir, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Aliq_Iss, Rpad('@', 7, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Vlr_Iss, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Trib_Icms, '@') || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Icms, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Trib_Ir, '@') || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Ir, Rpad('@', 17, ' ')) || Tab;
    Linha_w := Linha_w || Nvl(Saf.Trib_Iss, '@') || Tab;
    Linha_w := Linha_w || Nvl(Saf.Base_Iss, Rpad('@', 17, ' ')) || Tab;

    If p_Ident_Produto Is Not Null Then
      Begin
        Select Ind_Produto, Cod_Produto
          Into Ind_Produto_w, Cod_Produto_w
          From X2013_Produto
         Where Ident_Produto = p_Ident_Produto;

        If Ltrim(Ind_Produto_w) Is Not Null Then
          Linha_w := Linha_w || Ind_Produto_w || Tab;
        Else
          Linha_w := Linha_w || '@' || Tab;
        End If;

        If Ltrim(Cod_Produto_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Produto_w), 35, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 35, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60013;
          Chave_w    := p_Ident_Produto;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || '@' || Tab;
      Linha_w := Linha_w || Rpad('@', 35, ' ') || Tab;
    End If;

    If Ltrim(p_Compl_Isencao) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Compl_Isencao), 5, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
    End If;

    /* VALORES CSLL */
    If p_Vlr_Base_Csll Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Base_Csll * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Csll Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Aliq_Csll * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Csll Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Csll * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    /* VALORES PIS */
    If p_Vlr_Base_Pis Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Base_Pis * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Pis Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Aliq_Pis * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Pis Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Pis * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    /* VALORES COFINS */
    If p_Vlr_Base_Cofins Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Base_Cofins * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Aliq_Cofins Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(p_Vlr_Aliq_Cofins * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If p_Vlr_Cofins Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Cofins * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- CODIGO DA CONTA
    If p_Ident_Conta Is Not Null Then
      Begin
        Select Cod_Conta
          Into Cod_Conta_w
          From X2002_Plano_Contas
         Where Ident_Conta = p_Ident_Conta;

        If Ltrim(Cod_Conta_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Conta_w), 70, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 70, ' ') || Tab;
        End If;
      Exception
        When Others Then
          Cod_Erro_w := 60002;
          Chave_w    := p_Ident_Conta;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 70, ' ') || Tab;
    End If;

    IF P_IDENT_OBSERVACAO IS NOT NULL THEN
      BEGIN
        SELECT COD_OBSERVACAO
          INTO COD_OBSERVACAO_W
          FROM X2009_OBSERVACAO
         WHERE IDENT_OBSERVACAO = P_IDENT_OBSERVACAO;

        IF LTRIM(COD_OBSERVACAO_W) IS NOT NULL THEN
          LINHA_W := LINHA_W || RPAD(LTRIM(COD_OBSERVACAO_W), 8, ' ') || TAB;
        ELSE
          LINHA_W := LINHA_W || RPAD('@', 8, ' ') || TAB;
        END IF;

      EXCEPTION
        WHEN OTHERS THEN
          COD_ERRO_W := 60007;
          CHAVE_W    := P_IDENT_OBSERVACAO;
          MSG_ERRO_W := SUBSTR(SQLERRM, 1, 200);
          RAISE ERRO_LEITURA;
      END;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 8, ' ') || TAB;
    END IF;

    -- OS2191 --------------
    -- COD_TRIB_ISS
    IF LTRIM(P_COD_TRIB_ISS) IS NOT NULL THEN
      LINHA_W := LINHA_W || RPAD(LTRIM(P_COD_TRIB_ISS), 2, ' ') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 2, ' ') || TAB;
    END IF;

    -- VLR_MAT_PROP
    IF P_VLR_MAT_PROP IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_VLR_MAT_PROP * 100), 17, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 17, ' ') || TAB;
    END IF;

    -- VLR_MAT_TERC
    IF P_VLR_MAT_TERC IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_VLR_MAT_TERC * 100), 17, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 17, ' ') || TAB;
    END IF;

    -- VLR_BASE_ISS_RETIDO
    IF P_VLR_BASE_ISS_RETIDO IS NOT NULL THEN
      LINHA_W := LINHA_W ||
                 LPAD(TO_CHAR(P_VLR_BASE_ISS_RETIDO * 100), 17, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 17, ' ') || TAB;
    END IF;

    -- VLR_ISS_RETIDO
    IF P_VLR_ISS_RETIDO IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_VLR_ISS_RETIDO * 100), 17, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 17, ' ') || TAB;
    END IF;

    -- VLR_DEDUCAO_ISS
    IF P_VLR_DEDUCAO_ISS IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_VLR_DEDUCAO_ISS * 100), 17, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 17, ' ') || TAB;
    END IF;

    -- VLR_SUBEMPR_ISS
    IF P_VLR_SUBEMPR_ISS IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_VLR_SUBEMPR_ISS * 100), 17, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 17, ' ') || TAB;
    END IF;

    IF P_COD_CFPS IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(LTRIM(P_COD_CFPS), 4, ' ') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 4, ' ') || TAB;
    END IF;

    -- ÚLTMO CAMPO - SEM TAB
    IF P_VLR_OUT_DESP IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_VLR_OUT_DESP * 100), 17, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 17, ' ') || TAB;
    END IF;

    -- FIM DA OS2191 --------------

    /* INICIO - OS 2302  */
    IF P_VLR_BASE_CIDE IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_VLR_BASE_CIDE * 100), 17, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 17, ' ') || TAB;
    END IF;

    IF P_VLR_ALIQ_CIDE IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_VLR_ALIQ_CIDE * 10000), 7, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 7, ' ') || TAB;
    END IF;

    IF P_VLR_CIDE IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_VLR_CIDE * 100), 17, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 17, ' ') || TAB;
    END IF;

    IF P_VLR_COMISSAO IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_VLR_COMISSAO * 100), 17, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 17, ' ') || TAB;
    END IF; /* FIM - OS 2302  */

    IF LTRIM(P_IND_VLR_PIS_COFINS) IS NOT NULL THEN
      LINHA_W := LINHA_W || P_IND_VLR_PIS_COFINS || TAB;
    ELSE
      LINHA_W := LINHA_W || '@' || TAB;
    END IF;

    --OS2388-B2
    IF P_COD_SITUACAO_PIS IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_COD_SITUACAO_PIS), 2, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 2, ' ') || TAB;
    END IF;

    IF P_COD_SITUACAO_COFINS IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_COD_SITUACAO_COFINS), 2, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 2, ' ') || TAB;
    END IF;

    IF P_VLR_PIS_EXP IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_VLR_PIS_EXP * 100), 17, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 17, ' ') || TAB;
    END IF;

    IF P_VLR_PIS_TRIB IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_VLR_PIS_TRIB * 100), 17, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 17, ' ') || TAB;
    END IF;

    IF P_VLR_PIS_N_TRIB IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_VLR_PIS_N_TRIB * 100), 17, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 17, ' ') || TAB;
    END IF;

    IF P_VLR_COFINS_EXP IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_VLR_COFINS_EXP * 100), 17, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 17, ' ') || TAB;
    END IF;

    IF P_VLR_COFINS_TRIB IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_VLR_COFINS_TRIB * 100), 17, '0') || TAB;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 17, ' ') || TAB;
    END IF;

    -- ÚLTIMO CAMPO - SEM TAB
    IF P_VLR_COFINS_N_TRIB IS NOT NULL THEN
      LINHA_W := LINHA_W ||
                 LPAD(TO_CHAR(P_VLR_COFINS_N_TRIB * 100), 17, '0') || Tab;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 17, ' ') || Tab;
    END IF;

    If P_VLR_BASE_INSS Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_BASE_INSS * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_INSS_RETIDO Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_INSS_RETIDO * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_ALIQ_INSS Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_ALIQ_INSS * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    --OS3169-DW1

    If P_VLR_PIS_RETIDO Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_PIS_RETIDO * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_COFINS_RETIDO Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_COFINS_RETIDO * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_DAT_LANC_PIS_COFINS Is Not Null Then
      Linha_w := Linha_w || To_Char(P_DAT_LANC_PIS_COFINS, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(P_IND_PIS_COFINS_EXTEMP) Is Not Null Then
      Linha_w := Linha_w || P_IND_PIS_COFINS_EXTEMP || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(P_IND_LOCAL_EXEC_SERV) Is Not Null Then
      Linha_w := Linha_w || P_IND_LOCAL_EXEC_SERV || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If p_Ident_Custo Is Not Null Then
      Begin
        Select Cod_Custo
          Into Cod_Custo_w
          From X2003_Centro_Custo
         Where Ident_Custo = p_Ident_Custo;

        If Ltrim(Cod_Custo_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Custo_w), 20, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 20, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60003;
          Chave_w    := p_Ident_Custo;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 20, ' ') || Tab;
    End If;

    If Ltrim(P_COD_NAT_REC) Is Not Null Then
      -- OS3169-DW11
      Linha_w := Linha_w || Lpad(To_Char(P_COD_NAT_REC), 3, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    End If;

    If Ltrim(P_IND_NAT_BASE_CRED) Is Not Null Then
      -- OS3169-GE13B
      Linha_w := Linha_w || P_IND_NAT_BASE_CRED || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(P_VLR_ACRESCIMO) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_ACRESCIMO * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- OS3521
    If Ltrim(P_DSC_RESERVADO1) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_DSC_RESERVADO1), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If Ltrim(P_DSC_RESERVADO2) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_DSC_RESERVADO2), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If Ltrim(P_DSC_RESERVADO3) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_DSC_RESERVADO3), 50, ' ') || TAB;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || TAB;
    End If;

    If p_Ident_Nbs Is Not Null Then
      Begin
        Select Cod_NBS
          Into Cod_NBS_w
          From X2055_COD_NBS
         Where Ident_NBS = p_Ident_NBS;

        If Ltrim(Cod_NBS_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_NBS_w), 9, ' ') || TAB;
        Else
          Linha_w := Linha_w || Rpad('@', 9, ' ') || TAB;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 92464;
          Chave_w    := P_IDENT_NBS;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 9, ' ') || TAB;
    End If;

    -- OS 4514
    If P_VLR_TOT_ADIC Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_TOT_ADIC * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_TOT_RET Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_TOT_RET * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_DEDUCAO_NF Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_DEDUCAO_NF * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_RET_NF Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_RET_NF * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_RET_SERV Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_RET_SERV * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_ALIQ_ISS_RETIDO Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_ALIQ_ISS_RETIDO * 10000), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If P_COD_SIT_TRIB_ISS Is Not Null Then
      Linha_w := Linha_w || P_COD_SIT_TRIB_ISS || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If P_VLR_N_RET_PRINC Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_N_RET_PRINC * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_N_RET_ADIC Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_N_RET_ADIC * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_DED_ALIM Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_DED_ALIM * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_DED_TRANS Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_DED_TRANS * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- MFS10357
    If Ltrim(P_IND_TP_PROC_ADJ_PRINC) Is Not Null Then
      Linha_w := Linha_w || P_IND_TP_PROC_ADJ_PRINC || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If P_IDENT_PROC_ADJ_PRINC Is Not Null Then
      Begin
        Select num_proc_adj
          Into num_proc_adj_w
          From X2058_PROC_ADJ
         Where ident_proc_adj = p_ident_proc_adj_princ;

        If Ltrim(num_proc_adj_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(num_proc_adj_w), 21, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 21, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 92949;
          Chave_w    := P_IDENT_PROC_ADJ_PRINC;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 21, ' ') || Tab;
    End If;

    If P_IDENT_SUSP_TBT_PRINC Is Not Null Then
      Begin
        Select cod_susp
          Into cod_susp_w
          From X2059_SUSP_TBT
         Where ident_susp_tbt = p_ident_susp_tbt_princ;

        If Ltrim(cod_susp_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(cod_susp_w), 14, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 92950;
          Chave_w    := P_IDENT_SUSP_TBT_PRINC;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If Ltrim(P_IND_TP_PROC_ADJ_ADIC) Is Not Null Then
      Linha_w := Linha_w || P_IND_TP_PROC_ADJ_ADIC || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If P_IDENT_PROC_ADJ_ADIC Is Not Null Then
      Begin
        Select num_proc_adj
          Into num_proc_adj_adic_w
          From X2058_PROC_ADJ
         Where ident_proc_adj = p_ident_proc_adj_adic;

        If Ltrim(num_proc_adj_adic_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(num_proc_adj_adic_w), 21, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 21, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 92956;
          Chave_w    := P_IDENT_PROC_ADJ_ADIC;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 21, ' ') || Tab;
    End If;

    If P_IDENT_SUSP_TBT_ADIC Is Not Null Then
      Begin
        Select cod_susp
          Into cod_susp_adic_w
          From X2059_SUSP_TBT
         Where ident_susp_tbt = p_ident_susp_tbt_adic;

        If Ltrim(cod_susp_adic_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(cod_susp_adic_w), 14, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 92957;
          Chave_w    := P_IDENT_SUSP_TBT_ADIC;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If p_vlr_serv_15 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_vlr_serv_15 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_vlr_serv_20 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_vlr_serv_20 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_vlr_serv_25 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_vlr_serv_25 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_VLR_ABAT_NTRIBUTADO Is Not Null Then
      Linha_w := Linha_w ||
                 Lpad(To_Char(P_VLR_ABAT_NTRIBUTADO * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_COD_ATIV_RJ Is Not Null Then
      Linha_w := Linha_w || Rpad(LTRIM(P_COD_ATIV_RJ), 7, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 7, ' ') || Tab;
    End If;

    If Ltrim(P_DSC_RESERVADO4) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_DSC_RESERVADO4), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If Ltrim(P_DSC_RESERVADO5) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_DSC_RESERVADO5), 50, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 50, ' ') || Tab;
    End If;

    If P_DSC_RESERVADO6 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_DSC_RESERVADO6 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If P_DSC_RESERVADO7 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_DSC_RESERVADO7 * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    -- Último Campo
    If P_DSC_RESERVADO8 Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_DSC_RESERVADO8 * 100), 17, '0');
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ');
    End If;
    --

    Return Linha_w;

  End;


Function X10(p_Cod_Empresa         IN Varchar2,
               p_Cod_Estab           IN VARCHAR2,
               p_Movto_e_s           IN VARCHAR2,
               p_Norm_Dev            IN VARCHAR2,
               p_Grupo_Contagem      IN VARCHAR2,
               p_Ident_Docto         IN NUMBER,
               p_Data_Movto          IN DATE,
               p_Num_Docto           IN VARCHAR2,
               p_Serie_Docfis        IN VARCHAR2,
               p_Sub_Serie_Docfis    IN VARCHAR2,
               p_Ident_Produto       IN NUMBER,
               p_Discri_Estoque      IN VARCHAR2,
               p_Num_Item            IN NUMBER,
               p_Ident_Und_Padrao    IN Number,
               p_Ident_Almox         IN NUMBER,
               p_Ident_Custo         IN NUMBER,
               p_Ident_Nat_Estoque   IN Number,
               p_Contrato            IN VARCHAR2,
               p_Serie_Item          IN VARCHAR2,
               p_Qtd_Movto           IN NUMBER,
               p_Preco_Unit          IN NUMBER,
               p_Preco_Item          IN NUMBER,
               p_Custo_Unit          IN NUMBER,
               p_Custo_Item          IN NUMBER,
               p_Ident_Conta_Cred    IN Number,
               p_Ident_Conta_Debito  IN Number,
               p_Ident_Operacao      IN NUMBER,
               p_Ident_Cfo           IN NUMBER,
               p_Cod_Ent_Saida       IN VARCHAR2,
               p_Vlr_Ipi             IN NUMBER,
               p_Data_Escrita_Fis    IN DATE,
               p_Obs_Estoque         IN VARCHAR2,
               p_Ident_Medida        IN NUMBER,
               p_Ident_Nbm           IN NUMBER,
               p_Num_Processo        IN NUMBER,
               p_Ind_Gravacao        IN VARCHAR2,
               p_Ind_Insumo          IN VARCHAR2,
               p_Ident_Legenda       IN NUMBER,
               p_Num_Ordem           IN VARCHAR2,
               p_Num_Docfis_Ofic     IN VARCHAR2,
               p_Serie_Docfis_Ofic   IN Varchar2,
               p_s_Serie_Docfis_Ofic IN Varchar2,
               p_Ident_Fis_Jur       IN NUMBER,
               p_Ind_Tp_Movto        IN VARCHAR2,
               p_Insc_Estadual       IN VARCHAR2,
               p_Ident_Prod_Rastro   IN Number,
               p_Num_Livro           IN NUMBER,
               p_Num_Folha           IN NUMBER,
               p_Vlr_Icms            IN NUMBER,
               p_Data_Disp           IN DATE,
               p_Ind_Doc_Oper        IN VARCHAR2,
               p_Ind_Tp_Doc_Interno  IN Varchar2,
               p_Ind_Redesignacao    IN VARCHAR2,
               p_Ident_Produto_Ori   IN Varchar2,
               P_VLR_CUSTO_DCA       IN NUMBER,
               P_VLR_OUT_TRIB_NCUMUL IN Number,
               P_COD_TP_LANCTO       IN VARCHAR2,
               P_VLR_ICMS_DCA        IN NUMBER,
               P_COD_DIF_PRODUCAO    IN VARCHAR2,
               P_DSC_FINALIDADE      IN VARCHAR2,
               P_COD_TIPO_MOV_EST    IN VARCHAR2,
               p_Ident_Medida_Ori    IN Number,
               P_COD_NIVEL_PRODUTO   IN Number,
               p_Qtd_Insumo          IN NUMBER,
               P_IND_CF              IN VARCHAR2
               )

   Return Long Is
    Linha_w Long;

    --VARIAVEIS DE TRABALHO
    Tab               Varchar2(20) := CHR(9);
    Cod_Docto_w       Safx10.Cod_Docto%Type;
    Cod_Produto_w     Safx10.Cod_Produto%Type;
    Ind_Produto_w     Safx10.Ind_Produto%Type;
    Cod_Produto_Ori_w Safx10.Cod_Produto%Type;
    Ind_Produto_Ori_w Safx10.Ind_Produto%Type;
    Cod_Und_Padrao_w  Safx10.Cod_Und_Padrao%Type;
    Cod_Almox_w       Safx10.Cod_Almox%Type;
    Cod_Custo_w       Safx10.Cod_Custo%Type;
    Cod_Nat_Estoque_w Safx10.Cod_Nat_Estoque%Type;
    Cod_Operacao_w    Safx10.Cod_Operacao%Type;
    Cod_Cfo_w         Safx10.Cod_Cfo%Type;
    Cod_Medida_w      Safx10.Cod_Medida%Type;
    Cod_Medida_Ori_w  Safx10.Cod_Medida_Ori%Type;
    Cod_Nbm_w         Safx10.Cod_Nbm%Type;
    Cod_Conta_w       Safx10.Cod_Conta_Debito%Type;
    Cod_Legenda_w     Safx10.Cod_Legenda%Type;
    Ind_Fis_Jur_w     Safx10.Ind_Fis_Jur%Type;
    Cod_Fis_Jur_w     Safx10.Cod_Fis_Jur%Type;

    /* VARIAVEIS DE TRATAMENTO DE ERRO */
    Chave_w      Log_Det_Proc.Mens_Erro%Type;
    Cod_Erro_w   Log_Det_Proc.Cod_Erro%Type;
    Valor_Erro_w Log_Det_Proc.Mens_Compl%Type;
    Erro         Number := -1;
    Erro_Leitura Exception;
    Msg_Erro_w Varchar2(200);

  Begin

    If Ltrim(p_Cod_Empresa) Is Not Null Then
      Linha_w := Rpad(Ltrim(p_Cod_Empresa), 3, ' ') || Tab;
    Else
      Linha_w := Rpad('@', 3, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Estab) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Estab), 6, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
    End If;

    If Ltrim(p_Movto_e_s) Is Not Null Then
      Linha_w := Linha_w || p_Movto_e_s || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(p_Norm_Dev) Is Not Null Then
      Linha_w := Linha_w || p_Norm_Dev || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(p_Grupo_Contagem) Is Not Null Then
      Linha_w := Linha_w || p_Grupo_Contagem || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    Begin
      Select Cod_Docto
      Into   Cod_Docto_w
      From   X2005_Tipo_Docto
      Where  Ident_Docto = p_Ident_Docto;

      If Ltrim(Cod_Docto_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Docto_w), 5, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60005;
        Chave_w    := p_Ident_Docto;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    If Ltrim(p_Data_Movto) Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Data_Movto, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(p_Num_Docto) Is Null Then
      Linha_w := Linha_w || Rpad('@', 15, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Docto), 15, ' ') || Tab;
    End If;

    If Ltrim(p_Serie_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Serie_Docfis), 3, ' ') || Tab;
    End If;

    If Ltrim(p_Sub_Serie_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Sub_Serie_Docfis), 2, ' ') || Tab;
    End If;

    Begin
      Select Cod_Produto,
             Ind_Produto
      Into   Cod_Produto_w,
             Ind_Produto_w
      From   X2013_Produto
      Where  Ident_Produto = p_Ident_Produto;

      If Ind_Produto_w Is Not Null Then
        Linha_w := Linha_w || Ind_Produto_w || Tab;
      Else
        Linha_w := Linha_w || '@' || Tab;
      End If;

      If Ltrim(Cod_Produto_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Produto_w), 35, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 35, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60013;
        Chave_w    := p_Ident_Produto;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    If p_Ident_Und_Padrao Is Not Null Then
      Begin
        Select Cod_Und_Padrao
        Into   Cod_Und_Padrao_w
        From   X2017_Und_Padrao
        Where  Ident_Und_Padrao = p_Ident_Und_Padrao;

        If Ltrim(Cod_Und_Padrao_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Und_Padrao_w), 8, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60017;
          Chave_w    := p_Ident_Und_Padrao;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Ident_Almox Is Not Null Then
      Begin
        Select Cod_Almox
        Into   Cod_Almox_w
        From   X2021_Almoxarifado
        Where  Ident_Almox = p_Ident_Almox;

        If Ltrim(Cod_Almox_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Almox_w), 20, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 20, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60021;
          Chave_w    := p_Ident_Almox;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 20, ' ') || Tab;
    End If;

    If p_Ident_Custo Is Not Null Then
      Begin
        Select Cod_Custo
        Into   Cod_Custo_w
        From   X2003_Centro_Custo
        Where  Ident_Custo = p_Ident_Custo;

        If Ltrim(Cod_Custo_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Custo_w), 20, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 20, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60003;
          Chave_w    := p_Ident_Custo;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 20, ' ') || Tab;
    End If;

    If p_Num_Item Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Num_Item), 5, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
    End If;

    If p_Ident_Nat_Estoque Is Not Null Then
      Begin
        Select Cod_Nat_Estoque
        Into   Cod_Nat_Estoque_w
        From   X2010_Nat_Estoque
        Where  Ident_Nat_Estoque = p_Ident_Nat_Estoque;

        If Ltrim(Cod_Nat_Estoque_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Nat_Estoque_w), 2, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60010;
          Chave_w    := p_Ident_Nat_Estoque;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If Ltrim(p_Contrato) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Contrato), 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If Ltrim(p_Serie_Item) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Serie_Item), 15, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 15, ' ') || Tab;
    End If;

    If p_Qtd_Movto Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Qtd_Movto * 1000000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Preco_Unit Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Preco_Unit * 1000000), 18, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 18, ' ') || Tab;
    End If;

    If p_Preco_Item Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Preco_Item * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Custo_Unit Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Custo_Unit * 1000000), 18, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 18, ' ') || Tab;
    End If;

    If p_Custo_Item Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Custo_Item * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Ident_Conta_Cred Is Not Null Then
      Begin
        Select Cod_Conta
        Into   Cod_Conta_w
        From   X2002_Plano_Contas
        Where  Ident_Conta = p_Ident_Conta_Cred;

        If Ltrim(Cod_Conta_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Conta_w), 70, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 70, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60002;
          Chave_w    := p_Ident_Conta_Cred;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 70, ' ') || Tab;
    End If;

    If p_Ident_Conta_Debito Is Not Null Then
      Begin
        Select Cod_Conta
        Into   Cod_Conta_w
        From   X2002_Plano_Contas
        Where  Ident_Conta = p_Ident_Conta_Debito;

        If Ltrim(Cod_Conta_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Conta_w), 70, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 70, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60002;
          Chave_w    := p_Ident_Conta_Debito;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 70, ' ') || Tab;
    End If;

    If p_Ident_Operacao Is Not Null Then
      Begin
        Select Cod_Operacao
        Into   Cod_Operacao_w
        From   X2001_Operacao
        Where  Ident_Operacao = p_Ident_Operacao;

        If Ltrim(Cod_Operacao_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Operacao_w), 6, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60001;
          Chave_w    := p_Ident_Operacao;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
    End If;

    If p_Ident_Cfo Is Not Null Then
      Begin
        Select Cod_Cfo
        Into   Cod_Cfo_w
        From   X2012_Cod_Fiscal
        Where  Ident_Cfo = p_Ident_Cfo;

        If Ltrim(Cod_Cfo_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Cfo_w), 4, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60012;
          Chave_w    := p_Ident_Cfo;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 4, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Ent_Saida) Is Not Null Then
      Linha_w := Linha_w || p_Cod_Ent_Saida || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If p_Vlr_Ipi Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Ipi * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Obs_Estoque) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Obs_Estoque), 45, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 45, ' ') || Tab;
    End If;

    If p_Data_Escrita_Fis Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Data_Escrita_Fis, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Ident_Medida Is Not Null Then
      Begin
        Select Cod_Medida
        Into   Cod_Medida_w
        From   X2007_Medida
        Where  Ident_Medida = p_Ident_Medida;

        If Ltrim(Cod_Medida_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Medida_w), 8, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60007;
          Chave_w    := p_Ident_Medida;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Ident_Nbm Is Not Null Then
      Begin
        Select Cod_Nbm
        Into   Cod_Nbm_w
        From   X2043_Cod_Nbm
        Where  Ident_Nbm = p_Ident_Nbm;

        If Ltrim(Cod_Nbm_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Nbm_w), 10, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60043;
          Chave_w    := p_Ident_Nbm;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
    End If;

    If p_Ind_Insumo Is Not Null Then
      Linha_w := Linha_w || p_Ind_Insumo || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If p_Ident_Legenda Is Not Null Then
      Begin
        Select Cod_Legenda
        Into   Cod_Legenda_w
        From   X2008_Legenda_Prd
        Where  Ident_Legenda = p_Ident_Legenda;

        If Ltrim(Cod_Legenda_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Legenda_w), 5, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60008;
          Chave_w    := p_Ident_Legenda;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
    End If;

    If Ltrim(p_Num_Ordem) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Ordem), 30, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 30, ' ') || Tab;
    End If;

    If Ltrim(p_Num_Docfis_Ofic) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Docfis_Ofic), 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    End If;

    If Ltrim(p_Serie_Docfis_Ofic) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Serie_Docfis_Ofic), 3, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    End If;

    If Ltrim(p_s_Serie_Docfis_Ofic) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_s_Serie_Docfis_Ofic), 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    End If;

    If p_Ident_Fis_Jur Is Not Null Then
      Begin
        Select Ind_Fis_Jur,
               Cod_Fis_Jur
        Into   Ind_Fis_Jur_w,
               Cod_Fis_Jur_w
        From   X04_Pessoa_Fis_Jur
        Where  Ident_Fis_Jur = p_Ident_Fis_Jur;

        If Ind_Fis_Jur_w Is Not Null Then
          Linha_w := Linha_w || Ind_Fis_Jur_w || Tab;
        Else
          Linha_w := Linha_w || '@' || Tab;
        End If;

        If Ltrim(Cod_Fis_Jur_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Fis_Jur_w), 14, ' ') || Tab;
        Else
          Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
        End If;

      Exception
        When Others Then
          Cod_Erro_w := 60104;
          Chave_w    := p_Ident_Fis_Jur;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || '@' || Tab;
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    If p_Ind_Tp_Movto Is Not Null Then
      Linha_w := Linha_w || p_Ind_Tp_Movto || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If p_Insc_Estadual Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Insc_Estadual), 14, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
    End If;

    Begin
      Select Cod_Produto,
             Ind_Produto
      Into   Cod_Produto_w,
             Ind_Produto_w
      From   X2013_Produto
      Where  Ident_Produto = p_Ident_Prod_Rastro;
    Exception
      When Others Then
        Cod_Produto_w := Null;
        Ind_Produto_w := Null;
    End;

    If Ind_Produto_w Is Not Null Then
      Linha_w := Linha_w || Ind_Produto_w || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(Cod_Produto_w) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(Cod_Produto_w), 35, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 35, ' ') || Tab;
    End If;

    If p_Vlr_Icms Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Icms * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Data_Disp) Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Data_Disp, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If p_Ind_Doc_Oper Is Not Null Then
      Linha_w := Linha_w || p_Ind_Doc_Oper || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(p_Ind_Tp_Doc_Interno) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Tp_Doc_Interno), 30, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 30, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Redesignacao) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Redesignacao), 1, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ') || Tab;
    End If;

    Begin
      Select Cod_Produto,
             Ind_Produto
      Into   Cod_Produto_Ori_w,
             Ind_Produto_Ori_w
      From   X2013_Produto
      Where  Ident_Produto = p_Ident_Produto_Ori;

      If Ind_Produto_Ori_w Is Not Null Then
        Linha_w := Linha_w || Ind_Produto_Ori_w || Tab;
      Else
        Linha_w := Linha_w || '@' || Tab;
      End If;

      If Ltrim(Cod_Produto_Ori_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Produto_Ori_w), 35, ' ')|| Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 35, ' ')|| Tab;
      End If;

    Exception
      When Others Then
        Linha_w := Linha_w || '@' || Tab;
        Linha_w := Linha_w || Rpad('@', 35, ' ')|| Tab;
    End;

    /*OS2933-B - ABasto*/
    If Ltrim(P_VLR_CUSTO_DCA) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_CUSTO_DCA * 1000000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(P_VLR_OUT_TRIB_NCUMUL) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_OUT_TRIB_NCUMUL * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    IF LTRIM(P_COD_TP_LANCTO) IS NOT NULL THEN
       LINHA_W := LINHA_W || LPAD(P_COD_TP_LANCTO,6,'0') || Tab;
    ELSE
       LINHA_W := LINHA_W || RPAD('@',6,' ') || Tab;
    END IF;

    If Ltrim(P_VLR_ICMS_DCA) Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(P_VLR_ICMS_DCA * 1000000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(P_COD_DIF_PRODUCAO) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(P_COD_DIF_PRODUCAO), 15, ' ')|| TAB;
    Else
      Linha_w := Linha_w || Rpad('@', 15, ' ')|| TAB;
    End If;

    IF LTRIM(P_DSC_FINALIDADE) IS NOT NULL THEN
      LINHA_W := LINHA_W || RPAD(LTRIM(P_DSC_FINALIDADE), 255, ' ') || TAB ;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 255, ' ') || TAB ;
    END IF;

    IF LTRIM(P_COD_TIPO_MOV_EST) IS NOT NULL THEN
      LINHA_W := LINHA_W || RPAD(LTRIM(P_COD_TIPO_MOV_EST), 2, ' ') || TAB ;
    ELSE
      LINHA_W := LINHA_W || RPAD('@', 2, ' ') || TAB ;
    END IF;

    If p_Ident_Medida_Ori Is Not Null Then
      Begin
        Select Cod_Medida
        Into   Cod_Medida_Ori_w
        From   X2007_Medida
        Where  Ident_Medida = p_Ident_Medida_Ori;

        If Ltrim(Cod_Medida_Ori_w) Is Not Null Then
          Linha_w := Linha_w || Rpad(Ltrim(Cod_Medida_Ori_w), 8, ' ') || TAB;
        Else
          Linha_w := Linha_w || Rpad('@', 8, ' ') || TAB ;
        End If;


      Exception
        When Others Then
          Cod_Erro_w := 60007;
          Chave_w    := p_Ident_Medida_Ori;
          Msg_Erro_w := Substr(Sqlerrm, 1, 200);
          Raise Erro_Leitura;
      End;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || TAB ;
    End If;

    -- OS 3365-C
    IF P_COD_NIVEL_PRODUTO IS NOT NULL THEN
      LINHA_W := LINHA_W || LPAD(TO_CHAR(P_COD_NIVEL_PRODUTO), 3, ' ')|| Tab;
    ELSE
      LINHA_W := LINHA_W || LPAD('@', 3, ' ')|| Tab;
    END IF;

    If p_Qtd_Insumo Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Qtd_Insumo * 1000000), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If Ltrim(p_Ind_Cf) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Cf), 1, ' ');
    Else
      Linha_w := Linha_w || Rpad('@', 1, ' ');
    End If;

    Return Linha_w;
  End;


Function X112(p_Cod_Empresa       IN Varchar2,
                p_Cod_Estab         IN VARCHAR2,
                p_Data_Fiscal       IN DATE,
                p_Movto_e_s         IN VARCHAR2,
                p_Norm_Dev          IN VARCHAR2,
                p_Ident_Docto       IN NUMBER,
                p_Ident_Fis_Jur     IN Number,
                p_Num_Docfis        IN VARCHAR2,
                p_Serie_Docfis      IN VARCHAR2,
                p_Sub_Serie_Docfis  IN Varchar2,
                p_Ident_Observacao  IN Number,
                p_Ind_Icompl_Lancto IN Varchar2,
                p_Dsc_Complementar  IN Varchar2,
                p_Vinculacao        IN VARCHAR2)


   Return Long Is
    Linha_w Long;

    /* VARIAVEIS DE TRABALHO */
    Tab              Varchar2(20) := CHR(9);
    Cod_Docto_w      Safx112.Cod_Docto%Type;
    Cod_Fis_Jur_w    Safx112.Cod_Fis_Jur%Type;
    Ind_Fis_Jur_w    Safx112.Ind_Fis_Jur%Type;
    Cod_Estado_w     Estado.Cod_Estado%Type;
    Cod_Obs_Lancto_w Safx112.Cod_Obs_Lancto_Fiscal%Type;

    /* VARIAVEIS DE TRATAMENTO DE ERRO */
    Chave_w    Log_Det_Proc.Mens_Erro%Type;
    Cod_Erro_w Log_Det_Proc.Cod_Erro%Type;
    Erro_Leitura Exception;
    Msg_Erro_w Varchar2(200);

  Begin
    If Ltrim(p_Cod_Empresa) Is Not Null Then
      Linha_w := Rpad(Ltrim(p_Cod_Empresa), 3, ' ') || Tab;
    Else
      Linha_w := Rpad('@', 3, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Estab) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Estab), 6, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
    End If;

    If p_Data_Fiscal Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Data_Fiscal, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(p_Movto_e_s) Is Not Null Then
      Linha_w := Linha_w || p_Movto_e_s || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(p_Norm_Dev) Is Not Null Then
      Linha_w := Linha_w || p_Norm_Dev || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    Begin
      Select Cod_Docto
      Into   Cod_Docto_w
      From   X2005_Tipo_Docto
      Where  Ident_Docto = p_Ident_Docto;

      If Ltrim(Cod_Docto_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Docto_w), 5, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60005;
        Chave_w    := p_Ident_Docto;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    Begin
      Select Cod_Fis_Jur,
             Ind_Fis_Jur
      Into   Cod_Fis_Jur_w,
             Ind_Fis_Jur_w
      From   X04_Pessoa_Fis_Jur
      Where  Ident_Fis_Jur = p_Ident_Fis_Jur;

      If Ltrim(Ind_Fis_Jur_w) Is Not Null Then
        Linha_w := Linha_w || Ind_Fis_Jur_w || Tab;
      Else
        Linha_w := Linha_w || '@' || Tab;
      End If;

      If Ltrim(Cod_Fis_Jur_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Fis_Jur_w), 14, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60104;
        Chave_w    := p_Ident_Fis_Jur;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    If Ltrim(p_Num_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Docfis), 12, ' ') || Tab;
    End If;

    If Ltrim(p_Serie_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Serie_Docfis), 3, ' ') || Tab;
    End If;

    If Ltrim(p_Sub_Serie_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Sub_Serie_Docfis), 2, ' ') || Tab;
    End If;

    Begin
      Select Cod_Observacao
      Into   Cod_Obs_Lancto_w
      From   X2009_Observacao
      Where  Ident_Observacao = p_Ident_Observacao;

      If Ltrim(Cod_Obs_Lancto_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Obs_Lancto_w), 08, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 08, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60104;
        Chave_w    := p_Ident_Observacao;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    If Ltrim(p_Ind_Icompl_Lancto) Is Null Then
      Linha_w := Linha_w || '@' || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Ind_Icompl_Lancto), 1, ' ') || Tab;
    End If;

    If Ltrim(p_Dsc_Complementar) Is Null Then
      Linha_w := Linha_w || Rpad('@', 500, ' ') || Tab ;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Dsc_Complementar), 500, ' ') || Tab ;
    End If;

    If Ltrim(p_Vinculacao) Is Null Then
      Linha_w := Linha_w || '@';
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Vinculacao), 1, ' ');
    End If;

    Return Linha_w;
  End;


Function X113(p_Cod_Empresa      in Varchar2,
                p_Cod_Estab        IN VARCHAR2,
                p_Data_Fiscal      IN DATE,
                p_Movto_e_s        IN VARCHAR2,
                p_Norm_Dev         IN VARCHAR2,
                p_Ident_Docto      IN NUMBER,
                p_Ident_Fis_Jur    IN Number,
                p_Num_Docfis       IN VARCHAR2,
                p_Serie_Docfis     IN VARCHAR2,
                p_Sub_Serie_Docfis IN Varchar2,
                p_Ident_Observacao IN Number,
                p_Cod_Ajuste_Sped  IN Varchar2,
                p_Discri_Item      IN VARCHAR2,
                p_Dsc_Comp_Ajuste  IN Varchar2,
                p_Num_Item         IN NUMBER,
                p_Vlr_Base_Icms    IN Number,
                p_Aliquota_Icms    IN Number,
                p_Vlr_Icms         IN NUMBER,
                p_Vlr_Outros       IN NUMBER)

   Return Long Is
    Linha_w Long;

    /* VARIAVEIS DE TRABALHO */
    Tab               Varchar2(20) := CHR(9);
    Cod_Docto_w       Safx113.Cod_Docto%Type;
    Cod_Fis_Jur_w     Safx113.Cod_Fis_Jur%Type;
    Ind_Fis_Jur_w     Safx113.Ind_Fis_Jur%Type;
    Cod_Estado_w      Estado.Cod_Estado%Type;
    Cod_Obs_Lancto_w  Safx113.Cod_Obs_Lancto_Fiscal%Type;
    Cod_Ajuste_Sped_w Safx113.Cod_Ajuste_Sped%Type;

    /* VARIAVEIS DE TRATAMENTO DE ERRO */
    Chave_w    Log_Det_Proc.Mens_Erro%Type;
    Cod_Erro_w Log_Det_Proc.Cod_Erro%Type;
    Erro_Leitura Exception;
    Msg_Erro_w Varchar2(200);

  Begin
    If Ltrim(p_Cod_Empresa) Is Not Null Then
      Linha_w := Rpad(Ltrim(p_Cod_Empresa), 3, ' ') || Tab;
    Else
      Linha_w := Rpad('@', 3, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Estab) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Estab), 6, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
    End If;

    If p_Data_Fiscal Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Data_Fiscal, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(p_Movto_e_s) Is Not Null Then
      Linha_w := Linha_w || p_Movto_e_s || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(p_Norm_Dev) Is Not Null Then
      Linha_w := Linha_w || p_Norm_Dev || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    Begin
      Select Cod_Docto
      Into   Cod_Docto_w
      From   X2005_Tipo_Docto
      Where  Ident_Docto = p_Ident_Docto;

      If Ltrim(Cod_Docto_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Docto_w), 5, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60005;
        Chave_w    := p_Ident_Docto;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    Begin
      Select Cod_Fis_Jur,
             Ind_Fis_Jur
      Into   Cod_Fis_Jur_w,
             Ind_Fis_Jur_w
      From   X04_Pessoa_Fis_Jur
      Where  Ident_Fis_Jur = p_Ident_Fis_Jur;

      If Ltrim(Ind_Fis_Jur_w) Is Not Null Then
        Linha_w := Linha_w || Ind_Fis_Jur_w || Tab;
      Else
        Linha_w := Linha_w || '@' || Tab;
      End If;

      If Ltrim(Cod_Fis_Jur_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Fis_Jur_w), 14, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60104;
        Chave_w    := p_Ident_Fis_Jur;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    If Ltrim(p_Num_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Docfis), 12, ' ') || Tab;
    End If;

    If Ltrim(p_Serie_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Serie_Docfis), 3, ' ') || Tab;
    End If;

    If Ltrim(p_Sub_Serie_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Sub_Serie_Docfis), 2, ' ') || Tab;
    End If;

    Begin
      Select Cod_Observacao
      Into   Cod_Obs_Lancto_w
      From   X2009_Observacao
      Where  Ident_Observacao = p_Ident_Observacao;

      If Ltrim(Cod_Obs_Lancto_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Obs_Lancto_w), 08, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 08, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60104;
        Chave_w    := p_Ident_Observacao;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    Begin
      Select Cod_Ajuste_Sped
      Into   Cod_Ajuste_Sped_w
      From   Dwt_Cod_Ajuste_Sped
      Where  Cod_Ajuste_Sped = p_Cod_Ajuste_Sped;

      If Ltrim(Cod_Ajuste_Sped_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Ajuste_Sped_w), 10, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 10, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60104;
        Chave_w    := p_Cod_Ajuste_Sped;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    If Ltrim(p_Dsc_Comp_Ajuste) Is Null Then
      --Linha_w := Linha_w || Rpad('@', 255, ' ') || Tab;
      Linha_w := Linha_w || '@' || Tab;
    Else
      --Linha_w := Linha_w || Rpad(Ltrim(p_Dsc_Comp_Ajuste), 255, ' ') || Tab;
      Linha_w := Linha_w || TRIM(REPLACE(p_Dsc_Comp_Ajuste,chr(13),'')) || Tab;
    End If;

    If Ltrim(p_Num_Item) Is Null Then
      Linha_w := Linha_w || Rpad('@', 05, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Item), 05, ' ') || Tab;
    End If;

    If p_Vlr_Base_Icms Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Base_Icms * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Aliquota_Icms Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Aliquota_Icms * 10000), 07, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 07, ' ') || Tab;
    End If;

    If p_Vlr_Icms Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Icms * 100), 17, '0') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ') || Tab;
    End If;

    If p_Vlr_Outros Is Not Null Then
      Linha_w := Linha_w || Lpad(To_Char(p_Vlr_Outros * 100), 17, '0');
    Else
      Linha_w := Linha_w || Rpad('@', 17, ' ');
    End If;

    Return Linha_w;
  End;
 
Function X116(p_Cod_Empresa          in Varchar2,
                p_Cod_Estab            in Varchar2,
                p_Data_Fiscal          in Date,
                p_Movto_e_s            IN VARCHAR2,
                p_Norm_Dev             IN VARCHAR2,
                p_Ident_Docto          in Number,
                p_Ident_Fis_Jur        in Number,
                p_Num_Docfis           in Varchar2,
                p_Serie_Docfis         in Varchar2,
                p_Sub_Serie_Docfis     in Varchar2,
                p_Ident_Observacao     in Number,
                p_Data_Fiscal_Ref      in Date,
                p_Movto_e_s_Ref        IN VARCHAR2,
                p_Ident_Fis_Jur_Ref    in Number,
                p_Num_Docfis_Ref       in Varchar2,
                p_Serie_Docfis_Ref     in Varchar2,
                p_Sub_Serie_Docfis_Ref in Varchar2,
                p_Ident_Modelo_Ref     in Number,
                p_num_autentic_nfe     in Varchar2)

   Return Long Is
    Linha_w Long;

    /* VARIAVEIS DE TRABALHO */
    Tab              Varchar2(20) := CHR(9);
    Cod_Docto_w      Safx116.Cod_Docto%Type;
    Cod_Fis_Jur_w    Safx116.Cod_Fis_Jur%Type;
    Ind_Fis_Jur_w    Safx116.Ind_Fis_Jur%Type;
    Cod_Estado_w     Estado.Cod_Estado%Type;
    Cod_Obs_Lancto_w Safx116.Cod_Obs_Lancto_Fiscal%Type;
    Cod_Modelo_Ref_w Safx2024.Cod_Modelo%Type;

    /* VARIAVEIS DE TRATAMENTO DE ERRO */
    Chave_w    Log_Det_Proc.Mens_Erro%Type;
    Cod_Erro_w Log_Det_Proc.Cod_Erro%Type;
    Erro_Leitura Exception;
    Msg_Erro_w Varchar2(200);

  Begin
    If Ltrim(p_Cod_Empresa) Is Not Null Then
      Linha_w := Rpad(Ltrim(p_Cod_Empresa), 3, ' ') || Tab;
    Else
      Linha_w := Rpad('@', 3, ' ') || Tab;
    End If;

    If Ltrim(p_Cod_Estab) Is Not Null Then
      Linha_w := Linha_w || Rpad(Ltrim(p_Cod_Estab), 6, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 6, ' ') || Tab;
    End If;

    If p_Data_Fiscal Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Data_Fiscal, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    If Ltrim(p_Movto_e_s) Is Not Null Then
      Linha_w := Linha_w || p_Movto_e_s || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    If Ltrim(p_Norm_Dev) Is Not Null Then
      Linha_w := Linha_w || p_Norm_Dev || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    Begin
      Select Cod_Docto
      Into   Cod_Docto_w
      From   X2005_Tipo_Docto
      Where  Ident_Docto = p_Ident_Docto;

      If Ltrim(Cod_Docto_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Docto_w), 5, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 5, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60005;
        Chave_w    := p_Ident_Docto;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    Begin
      Select Cod_Fis_Jur,
             Ind_Fis_Jur
      Into   Cod_Fis_Jur_w,
             Ind_Fis_Jur_w
      From   X04_Pessoa_Fis_Jur
      Where  Ident_Fis_Jur = p_Ident_Fis_Jur;

      If Ltrim(Ind_Fis_Jur_w) Is Not Null Then
        Linha_w := Linha_w || Ind_Fis_Jur_w || Tab;
      Else
        Linha_w := Linha_w || '@' || Tab;
      End If;

      If Ltrim(Cod_Fis_Jur_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Fis_Jur_w), 14, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60104;
        Chave_w    := p_Ident_Fis_Jur;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    If Ltrim(p_Num_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Docfis), 12, ' ') || Tab;
    End If;

    If Ltrim(p_Serie_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Serie_Docfis), 3, ' ') || Tab;
    End If;

    If Ltrim(p_Sub_Serie_Docfis) Is Null Then
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Sub_Serie_Docfis), 2, ' ') || Tab;
    End If;

    Begin
      Select Cod_Observacao
      Into   Cod_Obs_Lancto_w
      From   X2009_Observacao
      Where  Ident_Observacao = p_Ident_Observacao;

      If Ltrim(Cod_Obs_Lancto_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Obs_Lancto_w), 08, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 08, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60104;
        Chave_w    := p_Ident_Observacao;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    If Ltrim(p_Num_Docfis_Ref) Is Null Then
      Linha_w := Linha_w || Rpad('@', 12, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Num_Docfis_Ref), 12, ' ') || Tab;
    End If;

    If Ltrim(p_Serie_Docfis_Ref) Is Null Then
      Linha_w := Linha_w || Rpad('@', 3, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Serie_Docfis_Ref), 3, ' ') || Tab;
    End If;

    If Ltrim(p_Sub_Serie_Docfis_Ref) Is Null Then
      Linha_w := Linha_w || Rpad('@', 2, ' ') || Tab;
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_Sub_Serie_Docfis_Ref), 2, ' ') || Tab;
    End If;

    If Ltrim(p_Movto_e_s_Ref) Is Not Null Then
      Linha_w := Linha_w || p_Movto_e_s_Ref || Tab;
    Else
      Linha_w := Linha_w || '@' || Tab;
    End If;

    Begin
      Select Cod_Fis_Jur,
             Ind_Fis_Jur
      Into   Cod_Fis_Jur_w,
             Ind_Fis_Jur_w
      From   X04_Pessoa_Fis_Jur
      Where  Ident_Fis_Jur = p_Ident_Fis_Jur_Ref;

      If Ltrim(Ind_Fis_Jur_w) Is Not Null Then
        Linha_w := Linha_w || Ind_Fis_Jur_w || Tab;
      Else
        Linha_w := Linha_w || '@' || Tab;
      End If;

      If Ltrim(Cod_Fis_Jur_w) Is Not Null Then
        Linha_w := Linha_w || Rpad(Ltrim(Cod_Fis_Jur_w), 14, ' ') || Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 14, ' ') || Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60104;
        Chave_w    := p_Ident_Fis_Jur_Ref;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

    If p_Data_Fiscal_Ref Is Not Null Then
      Linha_w := Linha_w || To_Char(p_Data_Fiscal_Ref, 'YYYYMMDD') || Tab;
    Else
      Linha_w := Linha_w || Rpad('@', 8, ' ') || Tab;
    End If;

    Begin
      -- OS2388-K4
      Select Cod_Modelo
      Into   Cod_Modelo_Ref_w
      From   X2024_Modelo_Docto
      Where  Ident_Modelo = p_Ident_Modelo_Ref;

      If Ltrim(Cod_Modelo_Ref_w) Is Not Null Then
        Linha_w := Linha_w || Lpad(Ltrim(Cod_Modelo_Ref_w), 2, '0')|| Tab;
      Else
        Linha_w := Linha_w || Rpad('@', 2, ' ')|| Tab;
      End If;

    Exception
      When Others Then
        Cod_Erro_w := 60024;
        Chave_w    := p_Ident_Modelo_Ref;
        Msg_Erro_w := Substr(Sqlerrm, 1, 200);
        Raise Erro_Leitura;
    End;

      If Ltrim(p_num_autentic_nfe) Is Null Then
      Linha_w := Linha_w || Rpad('@', 80, ' ');
    Else
      Linha_w := Linha_w || Rpad(Ltrim(p_num_autentic_nfe), 80, ' ');
    End If;

    Return Linha_w;
  End; 


FUNCTION X2013(pident_produto number,
              pgrupo_produto varchar2,
              pind_produto char,
              pcod_produto varchar2,
              pvalid_produto date,
              pdescricao varchar2,
              pident_nbm number,
              pind_regido_subst char,
              pind_controle_selo char,
              pnum_processo number,
              pind_gravacao char,
              pident_ncm number,
              pident_naladi number,
              pident_medida number,
              pident_grupo_prod number,
              pind_funrural char,
              pind_petr_energ char,
              pind_prd_incentiv char,
              pind_icms_diferido char,
              pcod_grp_incent varchar2,
              pcod_grupo_st varchar2,
              pident_conta number,
              pind_incid_icms_ser char,
              pident_und_padrao number,
              pvlr_peso_unit_kg number,
              pdescr_detalhada varchar2,
              pind_fabric_estab char,
              pfator_conversao number,
              pind_classif_icmss char,
              pdsc_modelo varchar2,
              porigem char,
              pident_grp_prod number,
              pind_incid_pis char,
              paliq_pis number,
              pind_incid_cofins char,
              paliq_cofins number,
              pcapac_volum number,
              pespecie_dnf number,
              pclas_item number,
              pcod_barras varchar2,
              pcod_anp number,
              pind_ant_prod char,
              pcod_ant_item varchar2,
              pdat_alt_codigo date,
              pclas_enquad_ipi varchar2,
              pmaterial_result_perda char,
              pdsc_finalidade varchar2,
              pqtd_cap_max_armaz number,
              pind_ativo_saics char,
              pind_tab_incidencia varchar2,
              pcod_grupo varchar2,
              pmarca_comercial varchar2,
              pind_carac_produto varchar2,
              pcod_cest varchar2,
              pvlr_reservado1 number,
              pvlr_reservado2 number,
              pvlr_reservado3 number,
              pdsc_reservado4 varchar2,
              pdsc_reservado5 varchar2,
              pdsc_reservado6 varchar2,
              pdsc_reservado7 varchar2,
              pdsc_reservado8 varchar2,
              pind_inc_ricms_pr VARCHAR2
              ) RETURN LONG IS


  /* VARIAVEIS DE TRABALHO */
  RSELO            X2013_PROD_CSELO%ROWTYPE;
  COD_NBM_W        X2043_COD_NBM.COD_NBM%TYPE;
  COD_NCM_W        X2045_COD_NCM.COD_NCM%TYPE;
  COD_NALADI_W     X2083_COD_NALADI.COD_NALADI%TYPE;
  COD_MEDIDA_W     X2007_MEDIDA.COD_MEDIDA%TYPE;
  COD_GRUPO_PROD_W GRUPO_PRODUTO.COD_GRUPO_PROD%TYPE;
  COD_CONTA_W      X2002_PLANO_CONTAS.COD_CONTA%TYPE;
  COD_UND_PADRAO_W X2017_UND_PADRAO.COD_UND_PADRAO%TYPE;
  COD_GRP_PROD_W   X58_SE_DIC_GRP_PRD.COD_GRP_PROD%TYPE;

  /* CONTADORES */
  AC_REG   integer := 0;
  SEQ_ERRO integer := 0;

  /* VARIAVEIS DE TRATAMENTO DE ERRO */
  CHAVE_W    LOG_DET_PROC.MENS_ERRO%TYPE;
  COD_ERRO_W LOG_DET_PROC.COD_ERRO%TYPE;
  ERRO       integer := -1;
  ERRO_LEITURA EXCEPTION;
  MSG_ERRO_W VARCHAR2(200);

  /* INICIO */
BEGIN
  
    BEGIN


      IF pIND_PRODUTO IS NOT NULL THEN
        LINHA_W := pIND_PRODUTO || TAB;
      ELSE
        LINHA_W := '@' || TAB;
      END IF;

      IF LTRIM(pCOD_PRODUTO) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pCOD_PRODUTO), 35, ' ') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 35, ' ') || TAB;
      END IF;

      IF LTRIM(pVALID_PRODUTO) IS NOT NULL THEN
        LINHA_W := LINHA_W || to_char(pVALID_PRODUTO, 'YYYYMMDD') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 8, ' ') || TAB;
      END IF;

      IF pDESCRICAO IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pDESCRICAO), 50, ' ') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 50, ' ') || TAB;
      END IF;

      IF pIDENT_NBM IS NOT NULL THEN
        BEGIN
          SELECT COD_NBM
            INTO COD_NBM_W
            FROM X2043_COD_NBM
           WHERE IDENT_NBM = pIDENT_NBM;

          IF COD_NBM_W IS NOT NULL THEN
            LINHA_W := LINHA_W || RPAD(LTRIM(COD_NBM_W), 10, ' ') || TAB;
          ELSE
            LINHA_W := LINHA_W || RPAD('@', 10, ' ') || TAB;
          END IF;

        EXCEPTION
          WHEN OTHERS THEN
            COD_ERRO_W := 60043;
            CHAVE_W    := pIDENT_NBM;
            MSG_ERRO_W := SUBSTR(SQLERRM, 1, 200);
            RAISE ERRO_LEITURA;
        END;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 10, ' ') || TAB;
      END IF;

      IF pIDENT_NCM IS NOT NULL THEN
        BEGIN
          SELECT COD_NCM
            INTO COD_NCM_W
            FROM X2045_COD_NCM
           WHERE IDENT_NCM = pIDENT_NCM;

          IF COD_NCM_W IS NOT NULL THEN
            LINHA_W := LINHA_W || RPAD(LTRIM(COD_NCM_W), 10, ' ') || TAB;
          ELSE
            LINHA_W := LINHA_W || RPAD('@', 10, ' ') || TAB;
          END IF;

        EXCEPTION
          WHEN OTHERS THEN
            COD_ERRO_W := 60045;
            CHAVE_W    := pIDENT_NCM;
            MSG_ERRO_W := 'AAA' || SUBSTR(SQLERRM, 1, 200);
            RAISE ERRO_LEITURA;
        END;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 10, ' ') || TAB;
      END IF;

      IF pIDENT_NALADI IS NOT NULL THEN
        BEGIN
          SELECT COD_NALADI
            INTO COD_NALADI_W
            FROM X2083_COD_NALADI
           WHERE IDENT_NALADI = pIDENT_NALADI;

          IF COD_NALADI_W IS NOT NULL THEN
            LINHA_W := LINHA_W || RPAD(LTRIM(COD_NALADI_W), 10, ' ') || TAB;
          ELSE
            LINHA_W := LINHA_W || RPAD('@', 10, ' ') || TAB;
          END IF;

        EXCEPTION
          WHEN OTHERS THEN
            COD_ERRO_W := 60083;
            CHAVE_W    := pIDENT_NALADI;
            MSG_ERRO_W := SUBSTR(SQLERRM, 1, 200);
            RAISE ERRO_LEITURA;
        END;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 10, ' ') || TAB;
      END IF;

      IF LTRIM(pIND_REGIDO_SUBST) IS NOT NULL THEN
        LINHA_W := LINHA_W || pIND_REGIDO_SUBST || TAB;
      ELSE
        LINHA_W := LINHA_W || '@' || TAB;
      END IF;

      IF LTRIM(pIND_CONTROLE_SELO) IS NOT NULL THEN
        LINHA_W := LINHA_W || pIND_CONTROLE_SELO || TAB;
      ELSE
        LINHA_W := LINHA_W || '@' || TAB;
      END IF;

      IF pIND_CONTROLE_SELO <> 'N' THEN
        BEGIN
          SELECT *
            INTO RSELO
            FROM X2013_PROD_CSELO
           WHERE IDENT_PRODUTO = pIDENT_PRODUTO;

          IF RSELO.COD_GRUPO_SELO IS NOT NULL THEN
            LINHA_W := LINHA_W || LPAD(to_char(RSELO.COD_GRUPO_SELO), 2, '0') || TAB;
          ELSE
            LINHA_W := LINHA_W || RPAD('@', 2, ' ') || TAB;
          END IF;

          IF RSELO.COD_SUBGRUPO_SELO IS NOT NULL THEN
            LINHA_W := LINHA_W || LPAD(to_char(RSELO.COD_SUBGRUPO_SELO), 2, '0') || TAB;
          ELSE
            LINHA_W := LINHA_W || RPAD('@', 2, ' ') || TAB;
          END IF;

          IF LTRIM(RSELO.COR_SELO) IS NOT NULL THEN
            LINHA_W := LINHA_W || RPAD(LTRIM(RSELO.COR_SELO), 15, ' ') || TAB;
          ELSE
            LINHA_W := LINHA_W || RPAD('@', 15, ' ') || TAB;
          END IF;

          IF LTRIM(RSELO.SERIE_SELO) IS NOT NULL THEN
            LINHA_W := LINHA_W || RPAD(LTRIM(RSELO.SERIE_SELO), 3, ' ') || TAB;
          ELSE
            LINHA_W := LINHA_W || RPAD('@', 3, ' ') || TAB;
          END IF;

        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            LINHA_W := LINHA_W || RPAD('@', 2, ' ') || TAB;
            LINHA_W := LINHA_W || RPAD('@', 2, ' ') || TAB;
            LINHA_W := LINHA_W || RPAD('@', 15, ' ') || TAB;
            LINHA_W := LINHA_W || RPAD('@', 3, ' ') || TAB;
          WHEN OTHERS THEN
            COD_ERRO_W := 60014;
            CHAVE_W    := pIDENT_PRODUTO;
            MSG_ERRO_W := SUBSTR(SQLERRM, 1, 200);
            RAISE ERRO_LEITURA;
        END;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 2, ' ') || TAB;
        LINHA_W := LINHA_W || RPAD('@', 2, ' ') || TAB;
        LINHA_W := LINHA_W || RPAD('@', 15, ' ') || TAB;
        LINHA_W := LINHA_W || RPAD('@', 3, ' ') || TAB;
      END IF;

      IF pIDENT_MEDIDA IS NOT NULL THEN
        BEGIN
          SELECT COD_MEDIDA
            INTO COD_MEDIDA_W
            FROM X2007_MEDIDA
           WHERE IDENT_MEDIDA = pIDENT_MEDIDA;

          IF COD_MEDIDA_W IS NOT NULL THEN
            LINHA_W := LINHA_W || RPAD(LTRIM(COD_MEDIDA_W), 8, ' ') || TAB;
          ELSE
            LINHA_W := LINHA_W || RPAD('@', 8, ' ') || TAB;
          END IF;

        EXCEPTION
          WHEN OTHERS THEN
            COD_ERRO_W := 60007;
            CHAVE_W    := pIDENT_MEDIDA;
            MSG_ERRO_W := SUBSTR(SQLERRM, 1, 200);
            RAISE ERRO_LEITURA;
        END;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 8, ' ') || TAB;
      END IF;

      IF pIDENT_GRUPO_PROD IS NOT NULL THEN
        BEGIN
          SELECT COD_GRUPO_PROD
            INTO COD_GRUPO_PROD_W
            FROM GRUPO_PRODUTO
           WHERE IDENT_GRUPO_PROD = pIDENT_GRUPO_PROD;

          IF COD_GRUPO_PROD_W IS NOT NULL THEN
            LINHA_W := LINHA_W || RPAD(LTRIM(COD_GRUPO_PROD_W), 5, ' ') || TAB;
          ELSE
            LINHA_W := LINHA_W || RPAD('@', 5, ' ') || TAB;
          END IF;

        EXCEPTION
          WHEN OTHERS THEN
            COD_ERRO_W := 60100;
            CHAVE_W    := pIDENT_GRUPO_PROD;
            MSG_ERRO_W := SUBSTR(SQLERRM, 1, 200);
            RAISE ERRO_LEITURA;
        END;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 5, ' ') || TAB;
      END IF;

      IF LTRIM(pCOD_GRP_INCENT) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pCOD_GRP_INCENT), 5, ' ') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 5, ' ') || TAB;
      END IF;

      IF LTRIM(pCOD_GRUPO_ST) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pCOD_GRUPO_ST), 2, ' ') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 2, ' ') || TAB;
      END IF;

      IF pIDENT_CONTA IS NOT NULL THEN
        BEGIN
          SELECT COD_CONTA
            INTO COD_CONTA_W
            FROM X2002_PLANO_CONTAS
           WHERE IDENT_CONTA = pIDENT_CONTA;

          IF LTRIM(COD_CONTA_W) IS NOT NULL THEN
            LINHA_W := LINHA_W || RPAD(LTRIM(COD_CONTA_W), 70, ' ') || TAB;
          ELSE
            LINHA_W := LINHA_W || RPAD('@', 70, ' ') || TAB;
          END IF;

        EXCEPTION
          WHEN OTHERS THEN
            COD_ERRO_W := 60002;
            CHAVE_W    := pIDENT_CONTA;
            MSG_ERRO_W := SUBSTR(SQLERRM, 1, 200);
            RAISE ERRO_LEITURA;
        END;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 70, ' ') || TAB;
      END IF;

      IF LTRIM(pIND_INCID_ICMS_SER) IS NOT NULL THEN
        LINHA_W := LINHA_W || pIND_INCID_ICMS_SER || TAB;
      ELSE
        LINHA_W := LINHA_W || '@' || TAB;
      END IF;

      IF pIDENT_UND_PADRAO IS NOT NULL THEN
        BEGIN
          SELECT COD_UND_PADRAO
            INTO COD_UND_PADRAO_W
            FROM X2017_UND_PADRAO
           WHERE IDENT_UND_PADRAO = pIDENT_UND_PADRAO;

          IF LTRIM(COD_UND_PADRAO_W) IS NOT NULL THEN
            LINHA_W := LINHA_W || RPAD(LTRIM(COD_UND_PADRAO_W), 8, ' ') || TAB;
          ELSE
            LINHA_W := LINHA_W || RPAD('@', 8, ' ') || TAB;
          END IF;

        EXCEPTION
          WHEN OTHERS THEN
            COD_ERRO_W := 60017;
            CHAVE_W    := pIDENT_UND_PADRAO;
            MSG_ERRO_W := SUBSTR(SQLERRM, 1, 200);
            RAISE ERRO_LEITURA;
        END;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 8, ' ') || TAB;
      END IF;

      IF LTRIM(pVLR_PESO_UNIT_KG) IS NOT NULL THEN
        LINHA_W := LINHA_W || LPAD(LTRIM(to_char(pVLR_PESO_UNIT_KG * 10000)), 13, '0') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 13, ' ') || TAB;
      END IF;

      IF LTRIM(pDESCR_DETALHADA) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pDESCR_DETALHADA), 250, ' ') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 250, ' ') || TAB;
      END IF;

      IF LTRIM(pIND_FABRIC_ESTAB) IS NOT NULL THEN
        LINHA_W := LINHA_W || pIND_FABRIC_ESTAB || TAB;
      ELSE
        LINHA_W := LINHA_W || '@' || TAB;
      END IF;

      IF LTRIM(pFATOR_CONVERSAO) IS NOT NULL THEN
        LINHA_W := LINHA_W || LPAD(LTRIM(to_char(pFATOR_CONVERSAO * 1000000)), 17, '0') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 17, ' ') || TAB;
      END IF;

      IF LTRIM(pIND_CLASSIF_ICMSS) IS NOT NULL THEN
        LINHA_W := LINHA_W || pIND_CLASSIF_ICMSS || TAB;
      ELSE
        LINHA_W := LINHA_W || '@' || TAB;
      END IF;

      IF LTRIM(pDSC_MODELO) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(pDSC_MODELO, 80, ' ') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 80, ' ') || TAB;
      END IF;

      IF LTRIM(pORIGEM) IS NOT NULL THEN
        LINHA_W := LINHA_W || pORIGEM || TAB;
      ELSE
        LINHA_W := LINHA_W || '@' || TAB;
      END IF;

      IF pIDENT_GRP_PROD IS NOT NULL THEN
        BEGIN
          SELECT COD_GRP_PROD
            INTO COD_GRP_PROD_W
            FROM X58_SE_DIC_GRP_PRD
           WHERE IDENT_GRP_PROD = pIDENT_GRP_PROD;

          IF LTRIM(COD_GRP_PROD_W) IS NOT NULL THEN
            LINHA_W := LINHA_W || RPAD(LTRIM(COD_GRP_PROD_W), 12, ' ') || TAB;
          ELSE
            LINHA_W := LINHA_W || RPAD('@', 12, ' ') || TAB;
          END IF;

        EXCEPTION
          WHEN OTHERS THEN
            COD_ERRO_W := 60017;
            CHAVE_W    := pIDENT_GRP_PROD;
            MSG_ERRO_W := SUBSTR(SQLERRM, 1, 200);
            RAISE ERRO_LEITURA;
        END;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 12, ' ') || TAB;
      END IF;

      IF LTRIM(pIND_INCID_PIS) IS NOT NULL THEN
        LINHA_W := LINHA_W || pIND_INCID_PIS || TAB;
      ELSE
        LINHA_W := LINHA_W || '@' || TAB;
      END IF;

      IF LTRIM(pALIQ_PIS) IS NOT NULL THEN
        LINHA_W := LINHA_W || LPAD(LTRIM(to_char(pALIQ_PIS * 10000)), 7, '0') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 7, ' ') || TAB;
      END IF;

      IF LTRIM(pIND_INCID_COFINS) IS NOT NULL THEN
        LINHA_W := LINHA_W || pIND_INCID_COFINS || TAB;
      ELSE
        LINHA_W := LINHA_W || '@' || TAB;
      END IF;

      IF LTRIM(pALIQ_COFINS) IS NOT NULL THEN
        LINHA_W := LINHA_W || LPAD(LTRIM(to_char(pALIQ_COFINS * 10000)), 7, '0') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 7, ' ') || TAB;
      END IF;

      IF LTRIM(pIND_FUNRURAL) IS NOT NULL THEN
        LINHA_W := LINHA_W || pIND_FUNRURAL || TAB;
      ELSE
        LINHA_W := LINHA_W || '@' || TAB;
      END IF;

      IF LTRIM(pIND_PETR_ENERG) IS NOT NULL THEN
        LINHA_W := LINHA_W || pIND_PETR_ENERG || TAB;
      ELSE
        LINHA_W := LINHA_W || '@' || TAB;
      END IF;

      IF LTRIM(pIND_PRD_INCENTIV) IS NOT NULL THEN
        LINHA_W := LINHA_W || pIND_PRD_INCENTIV || TAB;
      ELSE
        LINHA_W := LINHA_W || '@' || TAB;
      END IF;

      IF LTRIM(pIND_ICMS_DIFERIDO) IS NOT NULL THEN
        LINHA_W := LINHA_W || pIND_ICMS_DIFERIDO || TAB;
      ELSE
        LINHA_W := LINHA_W || '@' || TAB;
      END IF;

      IF LTRIM(pCAPAC_VOLUM) IS NOT NULL THEN
        LINHA_W := LINHA_W || LPAD(LTRIM(to_char(pCAPAC_VOLUM)), 5, '0') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 5, ' ') || TAB;
      END IF;

      IF LTRIM(pESPECIE_DNF) IS NOT NULL THEN
        LINHA_W := LINHA_W || LPAD(LTRIM(to_char(pESPECIE_DNF)), 3, '0')|| TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 3, ' ')|| TAB;
      END IF;


      IF LTRIM(pCLAS_ITEM) IS NOT NULL THEN
        LINHA_W := LINHA_W || LPAD(LTRIM(to_char(pCLAS_ITEM)), 2, '0') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 2, ' ') || TAB;
      END IF;

      IF LTRIM(pCOD_BARRAS) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pCOD_BARRAS), 60, ' ') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 60, ' ') || TAB;
      END IF;

      IF LTRIM(pCOD_ANP) IS NOT NULL THEN
        LINHA_W := LINHA_W || LPAD(LTRIM(to_char(pCOD_ANP)), 12, '0') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 12, ' ') || TAB;
      END IF;

      IF LTRIM(pIND_ANT_PROD) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pIND_ANT_PROD), 1, ' ') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 1, ' ') || TAB;
      END IF;

      IF LTRIM(pCOD_ANT_ITEM) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pCOD_ANT_ITEM), 35, ' ') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 35, ' ') || TAB;
      END IF;

      IF LTRIM(pDAT_ALT_CODIGO) IS NOT NULL THEN
        LINHA_W := LINHA_W || to_char(pDAT_ALT_CODIGO, 'YYYYMMDD') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 8, ' ') || TAB;
      END IF;

      IF LTRIM(pCLAS_ENQUAD_IPI) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pCLAS_ENQUAD_IPI), 5, ' ') || TAB ;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 5, ' ') || TAB ;
      END IF;

      IF LTRIM(pMATERIAL_RESULT_PERDA) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pMATERIAL_RESULT_PERDA), 1, ' ')|| TAB  ;
      ELSE
        LINHA_W := LINHA_W || '@' || TAB  ;
      END IF;

      IF LTRIM(pDSC_FINALIDADE) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pDSC_FINALIDADE), 255, ' ') || TAB ;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 255, ' ') || TAB ;
      END IF;

      IF LTRIM(pQTD_CAP_MAX_ARMAZ) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pQTD_CAP_MAX_ARMAZ * 1000000 ), 17, ' ') || TAB ;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 17, ' ') || TAB ;
      END IF;

      IF LTRIM(pIND_ATIVO_SAICS) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pIND_ATIVO_SAICS), 1, ' ') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 1, ' ') || TAB;
      END IF;

   IF LTRIM(pIND_TAB_INCIDENCIA) IS NOT NULL THEN -- OS3169-DW1
        LINHA_W := LINHA_W || RPAD(LTRIM(pIND_TAB_INCIDENCIA), 2, ' ') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 2, ' ') || TAB;
      END IF;

      IF LTRIM(pCOD_GRUPO) IS NOT NULL THEN -- OS3169-DW1
        LINHA_W := LINHA_W || RPAD(LTRIM(pCOD_GRUPO), 2, ' ') || TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 2, ' ') || TAB;
      END IF;

      IF LTRIM(pMARCA_COMERCIAL) IS NOT NULL THEN -- OS3169-DW1
        LINHA_W := LINHA_W || RPAD(LTRIM(pMARCA_COMERCIAL), 60, ' ')|| TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 60, ' ')|| TAB;
      END IF;

      IF LTRIM(pIND_CARAC_PRODUTO) IS NOT NULL THEN
        LINHA_W := LINHA_W || LTRIM(pIND_CARAC_PRODUTO)|| TAB;
      ELSE
        LINHA_W := LINHA_W || '@'|| TAB;
      END IF;

      IF LTRIM(pCOD_CEST) IS NOT NULL THEN -- OS3169-DW1
        LINHA_W := LINHA_W || RPAD(LTRIM(pCOD_CEST), 7, ' ')|| TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 7, ' ')|| TAB;
      END IF;

      IF LTRIM(pVLR_RESERVADO1) IS NOT NULL THEN
        LINHA_W := LINHA_W || LPAD((LTRIM(pVLR_RESERVADO1)* 100), 17, '0') || TAB;
      ELSE
        LINHA_W := LINHA_W || LPAD('@', 17, ' ') || TAB;
      END IF;

      IF LTRIM(pVLR_RESERVADO2) IS NOT NULL THEN
        LINHA_W := LINHA_W || LPAD((LTRIM(pVLR_RESERVADO2)* 100), 17, '0') || TAB;
      ELSE
        LINHA_W := LINHA_W || LPAD('@', 17, ' ') || TAB;
      END IF;

      IF LTRIM(pVLR_RESERVADO3) IS NOT NULL THEN
        LINHA_W := LINHA_W || LPAD((LTRIM(pVLR_RESERVADO3)* 100), 17, '0') || TAB;
      ELSE
        LINHA_W := LINHA_W || LPAD('@', 17, ' ') || TAB;
      END IF;

      IF LTRIM(pDSC_RESERVADO4) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pDSC_RESERVADO4), 50, ' ')|| TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 50, ' ')|| TAB;
      END IF;

      IF LTRIM(pDSC_RESERVADO5) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pDSC_RESERVADO5), 50, ' ')|| TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 50, ' ')|| TAB;
      END IF;

      IF LTRIM(pDSC_RESERVADO6) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pDSC_RESERVADO6), 50, ' ')|| TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 50, ' ')|| TAB;
      END IF;

      IF LTRIM(pDSC_RESERVADO7) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pDSC_RESERVADO7), 50, ' ')|| TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 50, ' ')|| TAB;
      END IF;

      IF LTRIM(pDSC_RESERVADO8) IS NOT NULL THEN
        LINHA_W := LINHA_W || RPAD(LTRIM(pDSC_RESERVADO8), 50, ' ')|| TAB;
      ELSE
        LINHA_W := LINHA_W || RPAD('@', 50, ' ')|| TAB;
      END IF;

      IF LTRIM(pIND_INC_RICMS_PR) IS NOT NULL THEN
        LINHA_W := LINHA_W || LTRIM(pIND_INC_RICMS_PR);
      ELSE
        LINHA_W := LINHA_W || '@';
      END IF;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        NULL;
    END;

  RETURN LINHA_W;
END;

  FUNCTION INSERT_LINE_SAFX07(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID is

    /* VETOR DA SAFX */
    REG SAFX07%ROWTYPE;

    strLinha LONG;
    
    v_rowid_retorno ROWID;

  BEGIN

    strLinha := pstrLinha;
    PROC_LINHA(strLinha, REG.COD_EMPRESA);
    PROC_LINHA(strLinha, REG.COD_ESTAB);
    PROC_LINHA(strLinha, REG.MOVTO_E_S, 'N', 'N');
    PROC_LINHA(strLinha, REG.NORM_DEV, 'N', 'N');
    PROC_LINHA(strLinha, REG.COD_DOCTO);
    PROC_LINHA(strLinha, REG.IDENT_FIS_JUR, 'N', 'N');
    PROC_LINHA(strLinha, REG.COD_FIS_JUR);
    PROC_LINHA(strLinha, REG.NUM_DOCFIS);
    PROC_LINHA(strLinha, REG.SERIE_DOCFIS);
    PROC_LINHA(strLinha, REG.SUB_SERIE_DOCFIS);
    PROC_LINHA(strLinha, REG.DATA_EMISSAO, 'S');
    PROC_LINHA(strLinha, REG.COD_CLASS_DOC_FIS, 'N', 'N');
    PROC_LINHA(strLinha, REG.COD_MODELO);
    PROC_LINHA(strLinha, REG.COD_CFO);
    PROC_LINHA(strLinha, REG.COD_NATUREZA_OP);
    PROC_LINHA(strLinha, REG.NUM_DOCFIS_REF);
    PROC_LINHA(strLinha, REG.SERIE_DOCFIS_REF);
    PROC_LINHA(strLinha, REG.S_SER_DOCFIS_REF);
    PROC_LINHA(strLinha, REG.NUM_DEC_IMP_REF);
    PROC_LINHA(strLinha, REG.DATA_SAIDA_REC, 'S');
    PROC_LINHA(strLinha, REG.INSC_ESTAD_SUBSTIT);
    PROC_LINHA(strLinha, REG.VLR_PRODUTO);
    PROC_LINHA(strLinha, REG.VLR_TOT_NOTA);
    PROC_LINHA(strLinha, REG.VLR_FRETE);
    PROC_LINHA(strLinha, REG.VLR_SEGURO);
    PROC_LINHA(strLinha, REG.VLR_OUTRAS);
    PROC_LINHA(strLinha, REG.VLR_BASE_DIF_FRETE);
    PROC_LINHA(strLinha, REG.VLR_DESCONTO);
    PROC_LINHA(strLinha, REG.CONTRIB_FINAL);
    PROC_LINHA(strLinha, REG.SITUACAO, 'N', 'N');
    PROC_LINHA(strLinha, REG.COD_INDICE);
    PROC_LINHA(strLinha, REG.VLR_NOTA_CONV);
    PROC_LINHA(strLinha, REG.COD_CONTA);
    PROC_LINHA(strLinha, REG.VLR_ALIQ_ICMS);
    PROC_LINHA(strLinha, REG.VLR_ICMS);
    PROC_LINHA(strLinha, REG.DIF_ALIQ_ICMS);
    PROC_LINHA(strLinha, REG.OBS_ICMS);
    PROC_LINHA(strLinha, REG.COD_APUR_ICMS);
    PROC_LINHA(strLinha, REG.VLR_ALIQ_IPI);
    PROC_LINHA(strLinha, REG.VLR_IPI);
    PROC_LINHA(strLinha, REG.OBS_IPI);
    PROC_LINHA(strLinha, REG.COD_APUR_IPI);
    PROC_LINHA(strLinha, REG.VLR_ALIQ_IR);
    PROC_LINHA(strLinha, REG.VLR_IR);
    PROC_LINHA(strLinha, REG.VLR_ALIQ_ISS);
    PROC_LINHA(strLinha, REG.VLR_ISS);
    PROC_LINHA(strLinha, REG.VLR_ALIQ_SUB_ICMS);
    PROC_LINHA(strLinha, REG.VLR_SUBST_ICMS);
    PROC_LINHA(strLinha, REG.OBS_SUBST_ICMS);
    PROC_LINHA(strLinha, REG.COD_APUR_SUB_ICMS);
    PROC_LINHA(strLinha, REG.BASE_TRIB_ICMS);
    PROC_LINHA(strLinha, REG.BASE_ISEN_ICMS);
    PROC_LINHA(strLinha, REG.BASE_OUTR_ICMS);
    PROC_LINHA(strLinha, REG.BASE_REDU_ICMS);
    PROC_LINHA(strLinha, REG.BASE_TRIB_IPI);
    PROC_LINHA(strLinha, REG.BASE_ISEN_IPI);
    PROC_LINHA(strLinha, REG.BASE_OUTR_IPI);
    PROC_LINHA(strLinha, REG.BASE_REDU_IPI);
    PROC_LINHA(strLinha, REG.BASE_TRIB_IR);
    PROC_LINHA(strLinha, REG.BASE_ISEN_IR);
    PROC_LINHA(strLinha, REG.BASE_TRIB_ISS);
    PROC_LINHA(strLinha, REG.BASE_ISEN_ISS);
    PROC_LINHA(strLinha, REG.BASE_REAL_TERC_ISS);
    PROC_LINHA(strLinha, REG.BASE_SUB_TRIB_ICMS);
    PROC_LINHA(strLinha, REG.NUM_MAQ_REG);
    PROC_LINHA(strLinha, REG.NUM_CUPON_FISC);
    PROC_LINHA(strLinha, REG.IND_MODELO_CUPOM);
    PROC_LINHA(strLinha, REG.VLR_CONTAB_COMPL);
    PROC_LINHA(strLinha, REG.NUM_CONTROLE_DOCTO);
    PROC_LINHA(strLinha, REG.VLR_ALIQ_DESTINO);
    PROC_LINHA(strLinha, REG.IND_NF_ESPECIAL, 'N', 'N');
    PROC_LINHA(strLinha, REG.IND_TP_FRETE, 'N', 'N');
    PROC_LINHA(strLinha, REG.COD_MUNICIPIO);
    PROC_LINHA(strLinha, REG.IND_TRANSF_CRED, 'N', 'N');
    PROC_LINHA(strLinha, REG.DAT_DI, 'S');
    PROC_LINHA(strLinha, REG.VLR_TOM_SERVICO);
    PROC_LINHA(strLinha, REG.DAT_ESCR_EXTEMP, 'S');
    PROC_LINHA(strLinha, REG.COD_TRIB_INT);
    PROC_LINHA(strLinha, REG.COD_REGIAO);
    PROC_LINHA(strLinha, REG.DAT_AUTENTIC, 'S');
    PROC_LINHA(strLinha, REG.COD_CANAL_DISTRIB);
    PROC_LINHA(strLinha, REG.IND_CRED_ICMSS, 'N', 'N');
    PROC_LINHA(strLinha, REG.VLR_ICMS_NDESTAC);
    PROC_LINHA(strLinha, REG.VLR_IPI_NDESTAC);
    PROC_LINHA(strLinha, REG.VLR_BASE_INSS);
    PROC_LINHA(strLinha, REG.VLR_ALIQ_INSS);
    PROC_LINHA(strLinha, REG.VLR_INSS_RETIDO);
    PROC_LINHA(strLinha, REG.VLR_MAT_APLIC_ISS);
    PROC_LINHA(strLinha, REG.VLR_SUBEMPR_ISS);
    PROC_LINHA(strLinha, REG.IND_MUNIC_ISS, 'N', 'N');
    PROC_LINHA(strLinha, REG.IND_CLASSE_OP_ISS, 'N', 'N');
    PROC_LINHA(strLinha, REG.VLR_OUTROS1);
    PROC_LINHA(strLinha, REG.DAT_FATO_GERADOR, 'S');
    PROC_LINHA(strLinha, REG.DAT_CANCELAMENTO, 'S');
    PROC_LINHA(strLinha, REG.NUM_PAGINA);
    PROC_LINHA(strLinha, REG.NUM_LIVRO);
    PROC_LINHA(strLinha, REG.NRO_AIDF_NF);
    PROC_LINHA(strLinha, REG.DAT_VALID_DOC_AIDF, 'S');
    PROC_LINHA(strLinha, REG.IND_FATURA);
    PROC_LINHA(strLinha, REG.COD_QUITACAO);
    PROC_LINHA(strLinha, REG.NUM_SELO_CONT_ICMS);
    PROC_LINHA(strLinha, REG.VLR_BASE_PIS);
    PROC_LINHA(strLinha, REG.VLR_PIS);
    PROC_LINHA(strLinha, REG.VLR_BASE_COFINS);
    PROC_LINHA(strLinha, REG.VLR_COFINS);
    PROC_LINHA(strLinha, REG.BASE_ICMS_ORIGDEST);
    PROC_LINHA(strLinha, REG.VLR_ICMS_ORIGDEST);
    PROC_LINHA(strLinha, REG.ALIQ_ICMS_ORIGDEST);
    PROC_LINHA(strLinha, REG.VLR_DESC_CONDIC);
    PROC_LINHA(strLinha, REG.VLR_BASE_ISE_ICMSS);
    PROC_LINHA(strLinha, REG.VLR_BASE_OUT_ICMSS);
    PROC_LINHA(strLinha, REG.VLR_RED_BASE_ICMSS);
    PROC_LINHA(strLinha, REG.PERC_RED_BASE_ICMS);
    PROC_LINHA(strLinha, REG.IND_FISJUR_CPDIR, 'N', 'N');
    PROC_LINHA(strLinha, REG.COD_FISJUR_CPDIR);
    PROC_LINHA(strLinha, REG.IND_MEDIDAJUDICIAL, 'N', 'N');
    PROC_LINHA(strLinha, REG.UF_ORIG_DEST);
    PROC_LINHA(strLinha, REG.IND_COMPRA_VENDA);
    PROC_LINHA(strLinha, REG.COD_TP_DISP_SEG);
    PROC_LINHA(strLinha, REG.NUM_CTR_DISP);
    PROC_LINHA(strLinha, REG.NUM_FIM_DOCTO);
    PROC_LINHA(strLinha, REG.UF_DESTINO);
    PROC_LINHA(strLinha, REG.SERIE_CTR_DISP);
    PROC_LINHA(strLinha, REG.SUB_SERIE_CTR_DISP);
    PROC_LINHA(strLinha, REG.IND_SITUACAO_ESP, 'N', 'N');
    PROC_LINHA(strLinha, REG.INSC_ESTADUAL);
    PROC_LINHA(strLinha, REG.COD_PAGTO_INSS);
    PROC_LINHA(strLinha, REG.DAT_INTERN_AM, 'S');
    PROC_LINHA(strLinha, REG.IND_FISJUR_LSG, 'N', 'N');
    PROC_LINHA(strLinha, REG.COD_FISJUR_LSG);
    PROC_LINHA(strLinha, REG.COMPROV_EXP);
    PROC_LINHA(strLinha, REG.NUM_FINAL_CRT_DISP);
    PROC_LINHA(strLinha, REG.NUM_ALVARA);
    PROC_LINHA(strLinha, REG.NOTIFICA_SEFAZ);
    PROC_LINHA(strLinha, REG.INTERNA_SUFRAMA);
    PROC_LINHA(strLinha, REG.COD_AMPARO);
    PROC_LINHA(strLinha, REG.IND_NOTA_SERVICO);
    PROC_LINHA(strLinha, REG.COD_MOTIVO);
    PROC_LINHA(strLinha, REG.UF_AMPARO_LEGAL);
    PROC_LINHA(strLinha, REG.OBS_COMPL_MOTIVO);
    PROC_LINHA(strLinha, REG.IND_TP_RET);
    PROC_LINHA(strLinha, REG.IND_TP_TOMADOR);

    -- OS 1417
    -- Este campo não estará trabalhando com as funções LTRIM e RTRIM
    -- pois o espaço é um conteúdo válido e identifica
    -- Substituição Tributária informada pelo substituto
    -- ou pelo substituido que não incorra em nenhuma das situações anteriores
    PROC_TRIM(strLinha, REG.COD_ANTEC_ST);

    PROC_LINHA(strLinha, REG.CNPJ_ARMAZ_ORIG);
    PROC_LINHA(strLinha, REG.UF_ARMAZ_ORIG);
    PROC_LINHA(strLinha, REG.INS_EST_ARMAZ_ORIG);
    PROC_LINHA(strLinha, REG.CNPJ_ARMAZ_DEST);
    PROC_LINHA(strLinha, REG.UF_ARMAZ_DEST);
    PROC_LINHA(strLinha, REG.INS_EST_ARMAZ_DEST);
    PROC_LINHA(strLinha, REG.OBS_INF_ADIC_NF);
    PROC_LINHA(strLinha, REG.VLR_BASE_INSS_2);
    PROC_LINHA(strLinha, REG.VLR_ALIQ_INSS_2);
    PROC_LINHA(strLinha, REG.VLR_INSS_RETIDO_2);
    PROC_LINHA(strLinha, REG.COD_PAGTO_INSS_2);
    PROC_LINHA(strLinha, REG.VLR_BASE_PIS_ST);
    PROC_LINHA(strLinha, REG.VLR_ALIQ_PIS_ST);
    PROC_LINHA(strLinha, REG.VLR_PIS_ST);
    PROC_LINHA(strLinha, REG.VLR_BASE_COFINS_ST);
    PROC_LINHA(strLinha, REG.VLR_ALIQ_COFINS_ST);
    PROC_LINHA(strLinha, REG.VLR_COFINS_ST);
    PROC_LINHA(strLinha, REG.VLR_BASE_CSLL);
    PROC_LINHA(strLinha, REG.VLR_ALIQ_CSLL);
    PROC_LINHA(strLinha, REG.VLR_CSLL);
    PROC_LINHA(strLinha, REG.VLR_ALIQ_PIS);
    PROC_LINHA(strLinha, REG.VLR_ALIQ_COFINS);
    PROC_LINHA(strLinha, REG.BASE_ICMSS_SUBSTITUIDO);
    PROC_LINHA(strLinha, REG.VLR_ICMSS_SUBSTITUIDO);
    PROC_LINHA(strLinha, REG.IND_SITUACAO_ESP_ST);
    PROC_LINHA(strLinha, REG.VLR_ICMSS_NDESTAC);
    PROC_LINHA(strLinha, REG.IND_DOCTO_REC);
    PROC_LINHA(strLinha, REG.DAT_PGTO_GNRE_DARJ);
    PROC_LINHA(strLinha, REG.COD_CEI);
    PROC_LINHA(strLinha, REG.VLR_JUROS_INSS);
    PROC_LINHA(strLinha, REG.VLR_MULTA_INSS);
    PROC_LINHA(strLinha, REG.DT_PAGTO_NF);
    PROC_LINHA(strLinha, REG.HORA_SAIDA);
    PROC_LINHA(strLinha, REG.COD_SIT_DOCFIS);
    PROC_LINHA(strLinha, REG.COD_OBSERVACAO);
    PROC_LINHA(strLinha, REG.COD_SITUACAO_A);
    PROC_LINHA(strLinha, REG.COD_SITUACAO_B);
    PROC_LINHA(strLinha, REG.NUM_CONT_REDUC);
    -- OS 2191
    PROC_LINHA(strLinha, REG.COD_MUNICIPIO_ORIG);
    PROC_LINHA(strLinha, REG.COD_MUNICIPIO_DEST);
    PROC_LINHA(strLinha, REG.COD_CFPS);
    PROC_LINHA(strLinha, REG.NUM_LANCAMENTO);
    PROC_LINHA(strLinha, REG.VLR_MAT_PROP);
    PROC_LINHA(strLinha, REG.VLR_MAT_TERC);
    PROC_LINHA(strLinha, REG.VLR_BASE_ISS_RETIDO);
    PROC_LINHA(strLinha, REG.VLR_ISS_RETIDO);
    PROC_LINHA(strLinha, REG.VLR_DEDUCAO_ISS);
    PROC_LINHA(strLinha, REG.COD_MUNIC_ARMAZ_ORIG);
    PROC_LINHA(strLinha, REG.INS_MUNIC_ARMAZ_ORIG);
    PROC_LINHA(strLinha, REG.COD_MUNIC_ARMAZ_DEST);
    PROC_LINHA(strLinha, REG.INS_MUNIC_ARMAZ_DEST);

    PROC_LINHA(strLinha, REG.COD_CLASSE_CONSUMO);
    PROC_LINHA(strLinha, REG.IND_ESPECIF_RECEITA);
    PROC_LINHA(strLinha, REG.NUM_CONTRATO);
    PROC_LINHA(strLinha, REG.COD_AREA_TERMINAL);
    PROC_LINHA(strLinha, REG.COD_TP_UTIL);
    PROC_LINHA(strLinha, REG.GRUPO_TENSAO);
    PROC_LINHA(strLinha, REG.DATA_CONSUMO_INI, 'S');
    PROC_LINHA(strLinha, REG.DATA_CONSUMO_FIM, 'S');
    PROC_LINHA(strLinha, REG.DATA_CONSUMO_LEIT, 'S');
    PROC_LINHA(strLinha, REG.QTD_CONTRATADA_PONTA);
    PROC_LINHA(strLinha, REG.QTD_CONTRATADA_FPONTA);
    PROC_LINHA(strLinha, REG.QTD_CONSUMO_TOTAL);
    PROC_LINHA(strLinha, REG.UF_CONSUMO);
    PROC_LINHA(strLinha, REG.COD_MUNIC_CONSUMO);
    PROC_LINHA(strLinha, REG.COD_OPER_ESP_ST);
    -- OS 2201
    PROC_LINHA(strLinha, REG.ATO_NORMATIVO);
    PROC_LINHA(strLinha, REG.NUM_ATO_NORMATIVO);
    PROC_LINHA(strLinha, REG.ANO_ATO_NORMATIVO);
    PROC_LINHA(strLinha, REG.CAPITULACAO_NORMA);
    PROC_LINHA(strLinha, REG.VLR_OUTRAS_ENTID);
    PROC_LINHA(strLinha, REG.VLR_TERCEIROS);
    PROC_LINHA(strLinha, REG.IND_TP_COMPL_ICMS);
    --OS2302
    PROC_LINHA(strLinha, REG.VLR_BASE_CIDE); --OS2302
    PROC_LINHA(strLinha, REG.VLR_ALIQ_CIDE); --OS2302
    PROC_LINHA(strLinha, REG.VLR_CIDE); --OS2302
    --OS2286
    PROC_LINHA(strLinha, REG.COD_VERIFIC_NFE);
    PROC_LINHA(strLinha, REG.COD_TP_RPS_NFE);
    PROC_LINHA(strLinha, REG.NUM_RPS_NFE);
    PROC_LINHA(strLinha, REG.SERIE_RPS_NFE);
    PROC_LINHA(strLinha, REG.DAT_EMISSAO_RPS_NFE, 'S');
    PROC_LINHA(strLinha, REG.DSC_SERVICO_NFE);
    --OS2295
    PROC_LINHA(strLinha, REG.NUM_AUTENTIC_NFE);
    --CH33683
    PROC_LINHA(strLinha, REG.NUM_DV_NFE);

    PROC_LINHA(strLinha, REG.MODELO_NF_DMS); -- OS2313

    PROC_LINHA(strLinha, REG.COD_MODELO_COTEPE); -- OS2354

    PROC_LINHA(strLinha, REG.VLR_COMISSAO); --OS2403
    PROC_LINHA(strLinha, REG.IND_NFE_DENEG_INUT); --OS2388-B
    PROC_LINHA(strLinha, REG.IND_NF_REG_ESPECIAL); --OS2388-B
    PROC_LINHA(strLinha, REG.VLR_ABAT_NTRIBUTADO); --OS2388-B
    PROC_LINHA(strLinha, REG.VLR_OUTROS_ICMS);

    PROC_LINHA(strLinha, REG.HORA_EMISSAO); -- OS2466-A
    PROC_LINHA(strLinha, REG.OBS_DADOS_FATURA); -- OS2466-A
    PROC_LINHA(strLinha, REG.IND_FIS_CONCES, 'N', 'N'); -- OS2388-Pdw
    PROC_LINHA(strLinha, REG.COD_FIS_CONCES); -- OS2388-Pdw
    PROC_LINHA(strLinha, REG.COD_AUTENTIC); -- OS2409-A
    PROC_LINHA(strLinha, REG.IND_PORT_CAT44, 'N', 'N'); -- OS2409-A
    --OS2388-B2
    PROC_LINHA(strLinha, REG.VLR_BASE_INSS_RURAL);
    PROC_LINHA(strLinha, REG.VLR_ALIQ_INSS_RURAL);
    PROC_LINHA(strLinha, REG.VLR_INSS_RURAL);
    PROC_LINHA(strLinha, REG.COD_CLASSE_CONSUMO_SEF_PE);

    PROC_LINHA(strLinha, REG.VLR_PIS_RETIDO); -- 3169-DW1
    PROC_LINHA(strLinha, REG.VLR_COFINS_RETIDO); -- 3169-DW1
    PROC_LINHA(strLinha, REG.DAT_LANC_PIS_COFINS); -- 3169-DW1
    PROC_LINHA(strLinha, REG.IND_PIS_COFINS_EXTEMP); -- 3169-DW1
    PROC_LINHA(strLinha, REG.COD_SIT_PIS); -- 3169-DW1
    PROC_LINHA(strLinha, REG.COD_SIT_COFINS); -- 3169-DW1
    PROC_LINHA(strLinha, REG.IND_NAT_FRETE); -- 3169-DW1
    PROC_LINHA(strLinha, REG.COD_NAT_REC); -- 3169-DW11
    PROC_LINHA(strLinha, REG.IND_VENDA_CANC); -- 3169-GE13
    PROC_LINHA(strLinha, REG.IND_NAT_BASE_CRED); -- 3169-GE13B
    PROC_LINHA(strLinha, REG.IND_NF_CONTINGENCIA);
    PROC_LINHA(strLinha, REG.VLR_ACRESCIMO);
    PROC_LINHA(strLinha, REG.VLR_ANTECIP_TRIB);
    PROC_LINHA(strLinha, REG.IND_IPI_NDESTAC_DF);
    -- OS 3521
    PROC_LINHA(strLinha, REG.DSC_RESERVADO1);
    PROC_LINHA(strLinha, REG.DSC_RESERVADO2);
    PROC_LINHA(strLinha, REG.DSC_RESERVADO3);
    PROC_LINHA(strLinha, REG.NUM_NFTS);
    PROC_LINHA(strLinha, REG.IND_NF_VENDA_TERCEIROS);
    PROC_LINHA(strLinha, REG.DSC_RESERVADO4);
    PROC_LINHA(strLinha, REG.DSC_RESERVADO5);
    PROC_LINHA(strLinha, REG.DSC_RESERVADO6);
    PROC_LINHA(strLinha, REG.DSC_RESERVADO7);
    PROC_LINHA(strLinha, REG.DSC_RESERVADO8);

    PROC_LINHA(strLinha, REG.IDENTIF_DOCFIS); -- OS3743
    PROC_LINHA(strLinha, REG.COD_SISTEMA_ORIG); -- OS3743
    PROC_LINHA(strLinha, REG.COD_SCP); -- OS4316

    PROC_LINHA(strLinha, REG.IND_PREST_SERV); -- OS4514
    PROC_LINHA(strLinha, REG.IND_TIPO_PROC); -- OS4514
    PROC_LINHA(strLinha, REG.NUM_PROC_JUR); -- OS4514
    PROC_LINHA(strLinha, REG.IND_DEC_PROC); -- OS4514
    PROC_LINHA(strLinha, REG.IND_TIPO_AQUIS); -- OS4514
    PROC_LINHA(strLinha, REG.VLR_DESC_GILRAT); -- OS4514
    PROC_LINHA(strLinha, REG.VLR_DESC_SENAR); -- OS4514

    PROC_LINHA(strLinha, REG.CNPJ_SUBEMPREITEIRO); -- OS4514
    PROC_LINHA(strLinha, REG.CNPJ_CPF_PROPRIETARIO_CNO); -- OS4514
    PROC_LINHA(strLinha, REG.VLR_RET_SUBEMPREITADO); -- OS4514

    PROC_LINHA(strLinha, REG.NUM_DOCFIS_SERV); -- OS 3341

    PROC_LINHA(strLinha, REG.VLR_FCP_UF_DEST); -- MFS2101
    PROC_LINHA(strLinha, REG.VLR_ICMS_UF_DEST); -- MFS2101
    PROC_LINHA(strLinha, REG.VLR_ICMS_UF_ORIG); -- MFS2101
    PROC_LINHA(strLinha, REG.VLR_CONTRIB_PREV); --OS2967
    PROC_LINHA(strLinha, REG.VLR_GILRAT); --OS2967
    PROC_LINHA(strLinha, REG.VLR_CONTRIB_SENAR); --OS2967
    PROC_LINHA(strLinha, REG.CPF_CNPJ); --MFS11800
    PROC_LINHA(strLinha, REG.NUM_CERTIF_QUAL); --MFS13120
    PROC_LINHA(strLinha, REG.OBS_REINF); --MFS14129
    PROC_LINHA(strLinha, REG.VLR_TOT_ADIC);
    PROC_LINHA(strLinha, REG.VLR_RET_SERV);
    PROC_LINHA(strLinha, REG.VLR_SERV_15);
    PROC_LINHA(strLinha, REG.VLR_SERV_20);
    PROC_LINHA(strLinha, REG.VLR_SERV_25);
    PROC_LINHA(strLinha, REG.VLR_IPI_DEV); --MFS20985
    PROC_LINHA(strLinha, REG.VLR_SEST);
    PROC_LINHA(strLinha, REG.VLR_SENAT);
    PROC_LINHA(strLinha, REG.IND_FIN_EMISSAO_NFE);
    PROC_LINHA(strLinha, REG.NUM_AUTENTIC_NFE_SUBST);
    PROC_LINHA(strLinha, REG.IND_VLR_ICMS_COB_ANT_ST);

    INSERT INTO SAFX07
      (COD_EMPRESA,
       COD_ESTAB,
       MOVTO_E_S,
       NORM_DEV,
       COD_DOCTO,
       IDENT_FIS_JUR,
       COD_FIS_JUR,
       NUM_DOCFIS,
       SERIE_DOCFIS,
       SUB_SERIE_DOCFIS,
       DATA_EMISSAO,
       COD_CLASS_DOC_FIS,
       COD_MODELO,
       COD_CFO,
       COD_NATUREZA_OP,
       NUM_DOCFIS_REF,
       SERIE_DOCFIS_REF,
       S_SER_DOCFIS_REF,
       NUM_DEC_IMP_REF,
       DATA_SAIDA_REC,
       INSC_ESTAD_SUBSTIT,
       VLR_PRODUTO,
       VLR_TOT_NOTA,
       VLR_FRETE,
       VLR_SEGURO,
       VLR_OUTRAS,
       VLR_BASE_DIF_FRETE,
       VLR_DESCONTO,
       CONTRIB_FINAL,
       SITUACAO,
       COD_INDICE,
       VLR_NOTA_CONV,
       COD_CONTA,
       VLR_ALIQ_ICMS,
       VLR_ICMS,
       DIF_ALIQ_ICMS,
       OBS_ICMS,
       COD_APUR_ICMS,
       VLR_ALIQ_IPI,
       VLR_IPI,
       OBS_IPI,
       COD_APUR_IPI,
       VLR_ALIQ_IR,
       VLR_IR,
       VLR_ALIQ_ISS,
       VLR_ISS,
       VLR_ALIQ_SUB_ICMS,
       VLR_SUBST_ICMS,
       OBS_SUBST_ICMS,
       COD_APUR_SUB_ICMS,
       BASE_TRIB_ICMS,
       BASE_ISEN_ICMS,
       BASE_OUTR_ICMS,
       BASE_REDU_ICMS,
       BASE_TRIB_IPI,
       BASE_ISEN_IPI,
       BASE_OUTR_IPI,
       BASE_REDU_IPI,
       BASE_TRIB_IR,
       BASE_ISEN_IR,
       BASE_TRIB_ISS,
       BASE_ISEN_ISS,
       BASE_REAL_TERC_ISS,
       BASE_SUB_TRIB_ICMS,
       NUM_MAQ_REG,
       NUM_CUPON_FISC,
       IND_MODELO_CUPOM,
       VLR_CONTAB_COMPL,
       NUM_CONTROLE_DOCTO,
       VLR_ALIQ_DESTINO,
       IND_NF_ESPECIAL,
       IND_TP_FRETE,
       COD_MUNICIPIO,
       IND_TRANSF_CRED,
       DAT_DI,
       VLR_TOM_SERVICO,
       DAT_ESCR_EXTEMP,
       COD_TRIB_INT,
       COD_REGIAO,
       DAT_AUTENTIC,
       COD_CANAL_DISTRIB,
       IND_CRED_ICMSS,
       VLR_ICMS_NDESTAC,
       VLR_IPI_NDESTAC,
       VLR_BASE_INSS,
       VLR_ALIQ_INSS,
       VLR_INSS_RETIDO,
       VLR_MAT_APLIC_ISS,
       VLR_SUBEMPR_ISS,
       IND_MUNIC_ISS,
       IND_CLASSE_OP_ISS,
       VLR_OUTROS1,
       DAT_FATO_GERADOR,
       DAT_CANCELAMENTO,
       NUM_PAGINA,
       NUM_LIVRO,
       NRO_AIDF_NF,
       DAT_VALID_DOC_AIDF,
       IND_FATURA,
       COD_QUITACAO,
       NUM_SELO_CONT_ICMS,
       VLR_BASE_PIS,
       VLR_PIS,
       VLR_BASE_COFINS,
       VLR_COFINS,
       BASE_ICMS_ORIGDEST,
       VLR_ICMS_ORIGDEST,
       ALIQ_ICMS_ORIGDEST,
       VLR_DESC_CONDIC,
       VLR_BASE_ISE_ICMSS,
       VLR_BASE_OUT_ICMSS,
       VLR_RED_BASE_ICMSS,
       PERC_RED_BASE_ICMS,
       IND_FISJUR_CPDIR,
       COD_FISJUR_CPDIR,
       IND_MEDIDAJUDICIAL,
       UF_ORIG_DEST,
       IND_COMPRA_VENDA,
       COD_TP_DISP_SEG,
       NUM_CTR_DISP,
       NUM_FIM_DOCTO,
       UF_DESTINO,
       SERIE_CTR_DISP,
       SUB_SERIE_CTR_DISP,
       IND_SITUACAO_ESP,
       INSC_ESTADUAL,
       COD_PAGTO_INSS,
       DAT_INTERN_AM,
       IND_FISJUR_LSG,
       COD_FISJUR_LSG,
       COMPROV_EXP,
       NUM_FINAL_CRT_DISP,
       NUM_ALVARA,
       NOTIFICA_SEFAZ,
       INTERNA_SUFRAMA,
       COD_AMPARO,
       IND_NOTA_SERVICO,
       COD_MOTIVO,
       UF_AMPARO_LEGAL,
       OBS_COMPL_MOTIVO,
       IND_TP_RET,
       IND_TP_TOMADOR,
       COD_ANTEC_ST,
       CNPJ_ARMAZ_ORIG,
       UF_ARMAZ_ORIG,
       INS_EST_ARMAZ_ORIG,
       CNPJ_ARMAZ_DEST,
       UF_ARMAZ_DEST,
       INS_EST_ARMAZ_DEST,
       OBS_INF_ADIC_NF,
       VLR_BASE_INSS_2,
       VLR_ALIQ_INSS_2,
       VLR_INSS_RETIDO_2,
       COD_PAGTO_INSS_2,
       VLR_BASE_PIS_ST,
       VLR_ALIQ_PIS_ST,
       VLR_PIS_ST,
       VLR_BASE_COFINS_ST,
       VLR_ALIQ_COFINS_ST,
       VLR_COFINS_ST,
       VLR_BASE_CSLL,
       VLR_ALIQ_CSLL,
       VLR_CSLL,
       VLR_ALIQ_PIS,
       VLR_ALIQ_COFINS,
       BASE_ICMSS_SUBSTITUIDO,
       VLR_ICMSS_SUBSTITUIDO,
       IND_SITUACAO_ESP_ST,
       VLR_ICMSS_NDESTAC,
       IND_DOCTO_REC,
       DAT_PGTO_GNRE_DARJ,
       COD_CEI,
       VLR_JUROS_INSS,
       VLR_MULTA_INSS,
       DT_PAGTO_NF,
       HORA_SAIDA,
       COD_SIT_DOCFIS,
       COD_OBSERVACAO,
       COD_SITUACAO_A,
       COD_SITUACAO_B,
       NUM_CONT_REDUC,
       COD_MUNICIPIO_ORIG,
       COD_MUNICIPIO_DEST,
       COD_CFPS,
       NUM_LANCAMENTO,
       VLR_MAT_PROP,
       VLR_MAT_TERC,
       VLR_BASE_ISS_RETIDO,
       VLR_ISS_RETIDO,
       VLR_DEDUCAO_ISS,
       COD_MUNIC_ARMAZ_ORIG,
       INS_MUNIC_ARMAZ_ORIG,
       COD_MUNIC_ARMAZ_DEST,
       INS_MUNIC_ARMAZ_DEST,
       COD_CLASSE_CONSUMO,
       IND_ESPECIF_RECEITA,
       NUM_CONTRATO,
       COD_AREA_TERMINAL,
       COD_TP_UTIL,
       GRUPO_TENSAO,
       DATA_CONSUMO_INI,
       DATA_CONSUMO_FIM,
       DATA_CONSUMO_LEIT,
       QTD_CONTRATADA_PONTA,
       QTD_CONTRATADA_FPONTA,
       QTD_CONSUMO_TOTAL,
       UF_CONSUMO,
       COD_MUNIC_CONSUMO,
       COD_OPER_ESP_ST,
       ATO_NORMATIVO,
       NUM_ATO_NORMATIVO,
       ANO_ATO_NORMATIVO,
       CAPITULACAO_NORMA,
       VLR_OUTRAS_ENTID,
       VLR_TERCEIROS,
       IND_TP_COMPL_ICMS,
       VLR_BASE_CIDE,
       VLR_ALIQ_CIDE,
       VLR_CIDE,
       COD_VERIFIC_NFE,
       COD_TP_RPS_NFE,
       NUM_RPS_NFE,
       SERIE_RPS_NFE,
       DAT_EMISSAO_RPS_NFE,
       DSC_SERVICO_NFE,
       NUM_AUTENTIC_NFE,
       NUM_DV_NFE,
       MODELO_NF_DMS,
       COD_MODELO_COTEPE,
       VLR_COMISSAO,
       IND_NFE_DENEG_INUT,
       IND_NF_REG_ESPECIAL,
       VLR_ABAT_NTRIBUTADO,
       VLR_OUTROS_ICMS,
       HORA_EMISSAO,
       OBS_DADOS_FATURA,
       IND_FIS_CONCES,
       COD_FIS_CONCES,
       COD_AUTENTIC,
       IND_PORT_CAT44,
       VLR_BASE_INSS_RURAL,
       VLR_ALIQ_INSS_RURAL,
       VLR_INSS_RURAL,
       COD_CLASSE_CONSUMO_SEF_PE,
       VLR_PIS_RETIDO,
       VLR_COFINS_RETIDO,
       DAT_LANC_PIS_COFINS,
       IND_PIS_COFINS_EXTEMP,
       COD_SIT_PIS,
       COD_SIT_COFINS,
       IND_NAT_FRETE,
       COD_NAT_REC,
       IND_VENDA_CANC,
       IND_NAT_BASE_CRED,
       IND_NF_CONTINGENCIA,
       VLR_ACRESCIMO,
       VLR_ANTECIP_TRIB,
       IND_IPI_NDESTAC_DF,
       DSC_RESERVADO1,
       DSC_RESERVADO2,
       DSC_RESERVADO3,
       NUM_NFTS,
       IND_NF_VENDA_TERCEIROS,
       DSC_RESERVADO4,
       DSC_RESERVADO5,
       DSC_RESERVADO6,
       DSC_RESERVADO7,
       DSC_RESERVADO8,
       IDENTIF_DOCFIS,
       COD_SISTEMA_ORIG,
       COD_SCP,
       IND_PREST_SERV,
       IND_TIPO_PROC,
       NUM_PROC_JUR,
       IND_DEC_PROC,
       IND_TIPO_AQUIS,
       VLR_DESC_GILRAT,
       VLR_DESC_SENAR,
       CNPJ_SUBEMPREITEIRO,
       CNPJ_CPF_PROPRIETARIO_CNO,
       VLR_RET_SUBEMPREITADO,
       NUM_DOCFIS_SERV,
       VLR_FCP_UF_DEST,
       VLR_ICMS_UF_DEST,
       VLR_ICMS_UF_ORIG,
       VLR_CONTRIB_PREV,
       VLR_GILRAT,
       VLR_CONTRIB_SENAR,
       CPF_CNPJ,
       NUM_CERTIF_QUAL,
       OBS_REINF,
       VLR_TOT_ADIC,
       VLR_RET_SERV,
       VLR_SERV_15,
       VLR_SERV_20,
       VLR_SERV_25,
       VLR_IPI_DEV,
       VLR_SEST,
       VLR_SENAT,
       IND_FIN_EMISSAO_NFE,
       NUM_AUTENTIC_NFE_SUBST,
       IND_VLR_ICMS_COB_ANT_ST,
       PST_ID)
    VALUES
      (REG.COD_EMPRESA,
       REG.COD_ESTAB,
       REG.MOVTO_E_S,
       REG.NORM_DEV,
       REG.COD_DOCTO,
       REG.IDENT_FIS_JUR,
       REG.COD_FIS_JUR,
       REG.NUM_DOCFIS,
       NVL(REG.SERIE_DOCFIS,'@'),
       NVL(REG.SUB_SERIE_DOCFIS,'@'),
       REG.DATA_EMISSAO,
       REG.COD_CLASS_DOC_FIS,
       REG.COD_MODELO,
       REG.COD_CFO,
       REG.COD_NATUREZA_OP,
       REG.NUM_DOCFIS_REF,
       REG.SERIE_DOCFIS_REF,
       REG.S_SER_DOCFIS_REF,
       REG.NUM_DEC_IMP_REF,
       REG.DATA_SAIDA_REC,
       REG.INSC_ESTAD_SUBSTIT,
       REG.VLR_PRODUTO,
       REG.VLR_TOT_NOTA,
       REG.VLR_FRETE,
       REG.VLR_SEGURO,
       REG.VLR_OUTRAS,
       REG.VLR_BASE_DIF_FRETE,
       REG.VLR_DESCONTO,
       REG.CONTRIB_FINAL,
       REG.SITUACAO,
       REG.COD_INDICE,
       REG.VLR_NOTA_CONV,
       REG.COD_CONTA,
       REG.VLR_ALIQ_ICMS,
       REG.VLR_ICMS,
       REG.DIF_ALIQ_ICMS,
       REG.OBS_ICMS,
       REG.COD_APUR_ICMS,
       REG.VLR_ALIQ_IPI,
       REG.VLR_IPI,
       REG.OBS_IPI,
       REG.COD_APUR_IPI,
       REG.VLR_ALIQ_IR,
       REG.VLR_IR,
       REG.VLR_ALIQ_ISS,
       REG.VLR_ISS,
       REG.VLR_ALIQ_SUB_ICMS,
       REG.VLR_SUBST_ICMS,
       REG.OBS_SUBST_ICMS,
       REG.COD_APUR_SUB_ICMS,
       REG.BASE_TRIB_ICMS,
       REG.BASE_ISEN_ICMS,
       REG.BASE_OUTR_ICMS,
       REG.BASE_REDU_ICMS,
       REG.BASE_TRIB_IPI,
       REG.BASE_ISEN_IPI,
       REG.BASE_OUTR_IPI,
       REG.BASE_REDU_IPI,
       REG.BASE_TRIB_IR,
       REG.BASE_ISEN_IR,
       REG.BASE_TRIB_ISS,
       REG.BASE_ISEN_ISS,
       REG.BASE_REAL_TERC_ISS,
       REG.BASE_SUB_TRIB_ICMS,
       REG.NUM_MAQ_REG,
       REG.NUM_CUPON_FISC,
       REG.IND_MODELO_CUPOM,
       REG.VLR_CONTAB_COMPL,
       REG.NUM_CONTROLE_DOCTO,
       REG.VLR_ALIQ_DESTINO,
       REG.IND_NF_ESPECIAL,
       REG.IND_TP_FRETE,
       REG.COD_MUNICIPIO,
       REG.IND_TRANSF_CRED,
       REG.DAT_DI,
       REG.VLR_TOM_SERVICO,
       REG.DAT_ESCR_EXTEMP,
       REG.COD_TRIB_INT,
       REG.COD_REGIAO,
       REG.DAT_AUTENTIC,
       REG.COD_CANAL_DISTRIB,
       REG.IND_CRED_ICMSS,
       REG.VLR_ICMS_NDESTAC,
       REG.VLR_IPI_NDESTAC,
       REG.VLR_BASE_INSS,
       REG.VLR_ALIQ_INSS,
       REG.VLR_INSS_RETIDO,
       REG.VLR_MAT_APLIC_ISS,
       REG.VLR_SUBEMPR_ISS,
       REG.IND_MUNIC_ISS,
       REG.IND_CLASSE_OP_ISS,
       REG.VLR_OUTROS1,
       REG.DAT_FATO_GERADOR,
       REG.DAT_CANCELAMENTO,
       REG.NUM_PAGINA,
       REG.NUM_LIVRO,
       REG.NRO_AIDF_NF,
       REG.DAT_VALID_DOC_AIDF,
       REG.IND_FATURA,
       REG.COD_QUITACAO,
       REG.NUM_SELO_CONT_ICMS,
       REG.VLR_BASE_PIS,
       REG.VLR_PIS,
       REG.VLR_BASE_COFINS,
       REG.VLR_COFINS,
       REG.BASE_ICMS_ORIGDEST,
       REG.VLR_ICMS_ORIGDEST,
       REG.ALIQ_ICMS_ORIGDEST,
       REG.VLR_DESC_CONDIC,
       REG.VLR_BASE_ISE_ICMSS,
       REG.VLR_BASE_OUT_ICMSS,
       REG.VLR_RED_BASE_ICMSS,
       REG.PERC_RED_BASE_ICMS,
       REG.IND_FISJUR_CPDIR,
       REG.COD_FISJUR_CPDIR,
       REG.IND_MEDIDAJUDICIAL,
       REG.UF_ORIG_DEST,
       REG.IND_COMPRA_VENDA,
       REG.COD_TP_DISP_SEG,
       REG.NUM_CTR_DISP,
       REG.NUM_FIM_DOCTO,
       REG.UF_DESTINO,
       REG.SERIE_CTR_DISP,
       REG.SUB_SERIE_CTR_DISP,
       REG.IND_SITUACAO_ESP,
       REG.INSC_ESTADUAL,
       REG.COD_PAGTO_INSS,
       REG.DAT_INTERN_AM,
       REG.IND_FISJUR_LSG,
       REG.COD_FISJUR_LSG,
       REG.COMPROV_EXP,
       REG.NUM_FINAL_CRT_DISP,
       REG.NUM_ALVARA,
       REG.NOTIFICA_SEFAZ,
       REG.INTERNA_SUFRAMA,
       REG.COD_AMPARO,
       REG.IND_NOTA_SERVICO,
       REG.COD_MOTIVO,
       REG.UF_AMPARO_LEGAL,
       REG.OBS_COMPL_MOTIVO,
       REG.IND_TP_RET,
       REG.IND_TP_TOMADOR,

       REG.COD_ANTEC_ST,

       REG.CNPJ_ARMAZ_ORIG,
       REG.UF_ARMAZ_ORIG,
       REG.INS_EST_ARMAZ_ORIG,
       REG.CNPJ_ARMAZ_DEST,
       REG.UF_ARMAZ_DEST,
       REG.INS_EST_ARMAZ_DEST,
       REG.OBS_INF_ADIC_NF,
       REG.VLR_BASE_INSS_2,
       REG.VLR_ALIQ_INSS_2,
       REG.VLR_INSS_RETIDO_2,
       REG.COD_PAGTO_INSS_2,
       REG.VLR_BASE_PIS_ST,
       REG.VLR_ALIQ_PIS_ST,
       REG.VLR_PIS_ST,
       REG.VLR_BASE_COFINS_ST,
       REG.VLR_ALIQ_COFINS_ST,
       REG.VLR_COFINS_ST,
       REG.VLR_BASE_CSLL,
       REG.VLR_ALIQ_CSLL,
       REG.VLR_CSLL,
       REG.VLR_ALIQ_PIS,
       REG.VLR_ALIQ_COFINS,
       REG.BASE_ICMSS_SUBSTITUIDO,
       REG.VLR_ICMSS_SUBSTITUIDO,
       REG.IND_SITUACAO_ESP_ST,
       REG.VLR_ICMSS_NDESTAC,
       REG.IND_DOCTO_REC,
       REG.DAT_PGTO_GNRE_DARJ,
       REG.COD_CEI,
       REG.VLR_JUROS_INSS,
       REG.VLR_MULTA_INSS,
       REG.DT_PAGTO_NF,
       REG.HORA_SAIDA,
       REG.COD_SIT_DOCFIS,
       REG.COD_OBSERVACAO,
       REG.COD_SITUACAO_A,
       REG.COD_SITUACAO_B,
       REG.NUM_CONT_REDUC,
       -- OS 2191
       REG.COD_MUNICIPIO_ORIG,
       REG.COD_MUNICIPIO_DEST,
       REG.COD_CFPS,
       REG.NUM_LANCAMENTO,
       REG.VLR_MAT_PROP,
       REG.VLR_MAT_TERC,
       REG.VLR_BASE_ISS_RETIDO,
       REG.VLR_ISS_RETIDO,
       REG.VLR_DEDUCAO_ISS,
       REG.COD_MUNIC_ARMAZ_ORIG,
       REG.INS_MUNIC_ARMAZ_ORIG,
       REG.COD_MUNIC_ARMAZ_DEST,
       REG.INS_MUNIC_ARMAZ_DEST,

       REG.COD_CLASSE_CONSUMO,
       REG.IND_ESPECIF_RECEITA,
       REG.NUM_CONTRATO,
       REG.COD_AREA_TERMINAL,
       REG.COD_TP_UTIL,
       REG.GRUPO_TENSAO,
       REG.DATA_CONSUMO_INI,
       REG.DATA_CONSUMO_FIM,
       REG.DATA_CONSUMO_LEIT,
       REG.QTD_CONTRATADA_PONTA,
       REG.QTD_CONTRATADA_FPONTA,
       REG.QTD_CONSUMO_TOTAL,
       REG.UF_CONSUMO,
       REG.COD_MUNIC_CONSUMO,
       REG.COD_OPER_ESP_ST,
       -- OS 2201
       REG.ATO_NORMATIVO,
       REG.NUM_ATO_NORMATIVO,
       REG.ANO_ATO_NORMATIVO,
       REG.CAPITULACAO_NORMA,
       REG.VLR_OUTRAS_ENTID,
       REG.VLR_TERCEIROS,
       REG.IND_TP_COMPL_ICMS,
       --OS2302
       REG.VLR_BASE_CIDE, --OS2302
       REG.VLR_ALIQ_CIDE, --OS2302
       REG.VLR_CIDE, --OS2302
       --OS2286
       REG.COD_VERIFIC_NFE,
       REG.COD_TP_RPS_NFE,
       REG.NUM_RPS_NFE,
       REG.SERIE_RPS_NFE,
       REG.DAT_EMISSAO_RPS_NFE,
       REG.DSC_SERVICO_NFE,
       --OS2295
       REG.NUM_AUTENTIC_NFE,
       --CH33683
       REG.NUM_DV_NFE,

       REG.MODELO_NF_DMS, -- OS2313

       REG.COD_MODELO_COTEPE, -- OS2354

       REG.VLR_COMISSAO, --OS2403
       REG.IND_NFE_DENEG_INUT, --OS2388-B
       REG.IND_NF_REG_ESPECIAL, --OS2388-B
       REG.VLR_ABAT_NTRIBUTADO, --OS2388-B
       REG.VLR_OUTROS_ICMS,

       REG.HORA_EMISSAO, -- OS2466-A
       REG.OBS_DADOS_FATURA, -- OS2466-A
       REG.IND_FIS_CONCES, -- OS2388-Pdw
       REG.COD_FIS_CONCES, -- OS2388-Pdw
       REG.COD_AUTENTIC, -- OS2409-A
       REG.IND_PORT_CAT44, -- OS2409-A
       --OS2388-B2
       REG.VLR_BASE_INSS_RURAL,
       REG.VLR_ALIQ_INSS_RURAL,
       REG.VLR_INSS_RURAL,
       REG.COD_CLASSE_CONSUMO_SEF_PE,

       REG.VLR_PIS_RETIDO, -- 3169-DW1
       REG.VLR_COFINS_RETIDO, -- 3169-DW1
       REG.DAT_LANC_PIS_COFINS, -- 3169-DW1
       REG.IND_PIS_COFINS_EXTEMP, -- 3169-DW1
       REG.COD_SIT_PIS, -- 3169-DW1
       REG.COD_SIT_COFINS, -- 3169-DW1
       REG.IND_NAT_FRETE, -- 3169-DW1
       REG.COD_NAT_REC, -- 3169-DW11
       REG.IND_VENDA_CANC, -- 3169-GE13
       REG.IND_NAT_BASE_CRED, -- 3169-GE13B
       REG.IND_NF_CONTINGENCIA,
       REG.VLR_ACRESCIMO,
       REG.VLR_ANTECIP_TRIB,
       REG.IND_IPI_NDESTAC_DF,
       -- OS 3521
       REG.DSC_RESERVADO1,
       REG.DSC_RESERVADO2,
       REG.DSC_RESERVADO3,
       REG.NUM_NFTS,
       REG.IND_NF_VENDA_TERCEIROS,
       REG.DSC_RESERVADO4,
       REG.DSC_RESERVADO5,
       REG.DSC_RESERVADO6,
       REG.DSC_RESERVADO7,
       REG.DSC_RESERVADO8,

       REG.IDENTIF_DOCFIS, -- OS3743
       REG.COD_SISTEMA_ORIG, -- OS3743
       REG.COD_SCP, -- OS4316

       REG.IND_PREST_SERV, -- OS4514
       REG.IND_TIPO_PROC, -- OS4514
       REG.NUM_PROC_JUR, -- OS4514
       REG.IND_DEC_PROC, -- OS4514
       REG.IND_TIPO_AQUIS, -- OS4514
       REG.VLR_DESC_GILRAT, -- OS4514
       REG.VLR_DESC_SENAR, -- OS4514

       REG.CNPJ_SUBEMPREITEIRO, -- OS4514
       REG.CNPJ_CPF_PROPRIETARIO_CNO, -- OS4514
       REG.VLR_RET_SUBEMPREITADO, -- OS4514

       REG.NUM_DOCFIS_SERV, -- OS 3341

       REG.VLR_FCP_UF_DEST, -- MFS2101
       REG.VLR_ICMS_UF_DEST, -- MFS2101
       REG.VLR_ICMS_UF_ORIG, -- MFS2101
       REG.VLR_CONTRIB_PREV, --OS2967
       REG.VLR_GILRAT, --OS2967
       REG.VLR_CONTRIB_SENAR, --OS2967
       REG.CPF_CNPJ, --MFS11800
       REG.NUM_CERTIF_QUAL, --MFS13120
       REG.OBS_REINF, --MFS14129
       REG.VLR_TOT_ADIC,
       REG.VLR_RET_SERV,
       REG.VLR_SERV_15,
       REG.VLR_SERV_20,
       REG.VLR_SERV_25,
       REG.VLR_IPI_DEV, --MFS20985
       REG.VLR_SEST,
       REG.VLR_SENAT,
       REG.IND_FIN_EMISSAO_NFE,
       REG.NUM_AUTENTIC_NFE_SUBST,
       REG.IND_VLR_ICMS_COB_ANT_ST,
       P_PROCESSO)
       
       RETURNING ROWID INTO v_rowid_retorno;
       
       RETURN v_rowid_retorno;

  end INSERT_LINE_SAFX07;

  FUNCTION INSERT_LINE_SAFX08(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID IS

    /* VETOR DA SAFX */
    REG SAFX08%ROWTYPE;
    
    v_rowid_retorno ROWID;

  BEGIN

    Linha_w := pstrLinha;
    PROC_LINHA(LINHA_W, REG.COD_EMPRESA);
    PROC_LINHA(LINHA_W, REG.COD_ESTAB);
    PROC_LINHA(LINHA_W, REG.DATA_FISCAL, 'S');
    PROC_LINHA(LINHA_W, REG.MOVTO_E_S, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.NORM_DEV, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_DOCTO);
    PROC_LINHA(LINHA_W, REG.IND_FIS_JUR, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_FIS_JUR);
    PROC_LINHA(LINHA_W, REG.NUM_DOCFIS);
    PROC_LINHA(LINHA_W, REG.SERIE_DOCFIS);
    PROC_LINHA(LINHA_W, REG.SUB_SERIE_DOCFIS);
    PROC_LINHA(LINHA_W, REG.IND_BEM_PATR, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.IND_PRODUTO, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_PRODUTO);
    PROC_LINHA(LINHA_W, REG.COD_BEM);
    PROC_LINHA(LINHA_W, REG.COD_INC_BEM);
    PROC_LINHA(LINHA_W, REG.COD_UND_PADRAO);
    PROC_LINHA(LINHA_W, REG.NUM_ITEM);
    PROC_LINHA(LINHA_W, REG.COD_ALMOX);
    PROC_LINHA(LINHA_W, REG.COD_CUSTO);
    PROC_LINHA(LINHA_W, REG.DESCRICAO_COMPL);
    PROC_LINHA(LINHA_W, REG.COD_CFO);
    PROC_LINHA(LINHA_W, REG.COD_NATUREZA_OP);
    PROC_LINHA(LINHA_W, REG.QUANTIDADE);
    PROC_LINHA(LINHA_W, REG.COD_MEDIDA);
    PROC_LINHA(LINHA_W, REG.COD_NBM);
    PROC_LINHA(LINHA_W, REG.VLR_UNIT);
    IF NVL(PKG_CONSIST_IMP.IND_ESPECIAL_W, 'S') = 'N' THEN
      REG.VLR_UNIT := REG.VLR_UNIT || '00';
    END IF;
    PROC_LINHA(LINHA_W, REG.VLR_ITEM);
    PROC_LINHA(LINHA_W, REG.VLR_DESCONTO);
    PROC_LINHA(LINHA_W, REG.COD_SITUACAO_A, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_SITUACAO_B, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_FEDERAL);
    PROC_LINHA(LINHA_W, REG.IND_IPI_INCLUSO, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.NUM_ROMANEIO);
    PROC_LINHA(LINHA_W, REG.DATA_ROMANEIO, 'S');
    PROC_LINHA(LINHA_W, REG.PESO_LIQUIDO);
    PROC_LINHA(LINHA_W, REG.COD_INDICE);
    PROC_LINHA(LINHA_W, REG.VLR_ITEM_CONVER);
    PROC_LINHA(LINHA_W, REG.VLR_FRETE);
    PROC_LINHA(LINHA_W, REG.VLR_SEGURO);
    PROC_LINHA(LINHA_W, REG.VLR_OUTRAS);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_ICMS);
    PROC_LINHA(LINHA_W, REG.VLR_ICMS);
    PROC_LINHA(LINHA_W, REG.DIF_ALIQ_ICMS);
    PROC_LINHA(LINHA_W, REG.OBS_ICMS);
    PROC_LINHA(LINHA_W, REG.COD_APUR_ICMS);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_IPI);
    PROC_LINHA(LINHA_W, REG.VLR_IPI);
    PROC_LINHA(LINHA_W, REG.OBS_IPI);
    PROC_LINHA(LINHA_W, REG.COD_APUR_IPI);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_SUB_ICMS);
    PROC_LINHA(LINHA_W, REG.VLR_SUBST_ICMS);
    PROC_LINHA(LINHA_W, REG.OBS_SUBST_ICMS);
    PROC_LINHA(LINHA_W, REG.COD_APUR_SUB_ICMS);
    PROC_LINHA(LINHA_W, REG.TRIB_ICMS, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.BASE_ICMS);
    PROC_LINHA(LINHA_W, REG.BASE_REDU_ICMS);
    PROC_LINHA(LINHA_W, REG.TRIB_IPI, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.BASE_IPI);
    PROC_LINHA(LINHA_W, REG.BASE_REDU_IPI);
    PROC_LINHA(LINHA_W, REG.BASE_SUB_TRIB_ICMS);
    PROC_LINHA(LINHA_W, REG.VLR_CONTAB_COMPL);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_DESTINO);
    PROC_LINHA(LINHA_W, REG.VLR_CONTAB_ITEM);
    PROC_LINHA(LINHA_W, REG.COD_OBS_VCONT_COMP);
    PROC_LINHA(LINHA_W, REG.COD_OBS_VCONT_ITEM);
    PROC_LINHA(LINHA_W, REG.VLR_OUTROS_ICMS);
    PROC_LINHA(LINHA_W, REG.VLR_OUTROS_IPI);
    PROC_LINHA(LINHA_W, REG.VLR_OUTROS1);
    PROC_LINHA(LINHA_W, REG.NUM_ATO_CONCES);
    PROC_LINHA(LINHA_W, REG.DAT_EMBARQUE, 'S');
    PROC_LINHA(LINHA_W, REG.NUM_REG_EXP);
    PROC_LINHA(LINHA_W, REG.NUM_DESP_EXP);
    PROC_LINHA(LINHA_W, REG.VLR_TOM_SERVICO);
    PROC_LINHA(LINHA_W, REG.VLR_DESP_MOEDA_EXP);
    PROC_LINHA(LINHA_W, REG.COD_MOEDA_NEGOC);
    PROC_LINHA(LINHA_W, REG.COD_PAIS_DEST_ORIG);
    PROC_LINHA(LINHA_W, REG.IND_CRED_ICMSS, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_TRIB_INT);
    PROC_LINHA(LINHA_W, REG.VLR_ICMS_NDESTAC);
    PROC_LINHA(LINHA_W, REG.VLR_IPI_NDESTAC);
    PROC_LINHA(LINHA_W, REG.TRIB_ICMS_AUX, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.BASE_ICMS_AUX);
    PROC_LINHA(LINHA_W, REG.TRIB_IPI_AUX, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.BASE_IPI_AUX, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.VLR_BASE_PIS, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.VLR_PIS, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.VLR_BASE_COFINS, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.VLR_COFINS, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.BASE_ICMS_ORIGDEST, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.VLR_ICMS_ORIGDEST, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.ALIQ_ICMS_ORIGDEST, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.VLR_DESC_CONDIC, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.TRIB_ICMSS, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.BASE_REDU_ICMSS, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.VLR_CUSTO_TRANSF, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.PERC_RED_BASE_ICMS, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.QTD_EMBARCADA, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.DAT_REGISTRO_EXP, 'S');
    PROC_LINHA(LINHA_W, REG.DAT_DESPACHO, 'S');
    PROC_LINHA(LINHA_W, REG.DAT_AVERBACAO, 'S');
    PROC_LINHA(LINHA_W, REG.DAT_DI, 'S');
    PROC_LINHA(LINHA_W, REG.NUM_DEC_IMP_REF);
    PROC_LINHA(LINHA_W, REG.DSC_MOT_OCOR);
    PROC_LINHA(LINHA_W, REG.COD_CONTA);
    PROC_LINHA(LINHA_W, REG.VLR_BASE_ICMS_ORIG);
    PROC_LINHA(LINHA_W, REG.VLR_TRIB_ICMS_ORIG);
    PROC_LINHA(LINHA_W, REG.VLR_BASE_ICMS_DEST);
    PROC_LINHA(LINHA_W, REG.VLR_TRIB_ICMS_DEST);
    PROC_LINHA(LINHA_W, REG.VLR_PERC_PRES_ICMS);
    PROC_LINHA(LINHA_W, REG.VLR_PRECO_BASE_ST);
    PROC_LINHA(LINHA_W, REG.COD_OPER_OIL);
    PROC_LINHA(LINHA_W, REG.COD_DCR);
    PROC_LINHA(LINHA_W, REG.COD_PROJETO);
    PROC_LINHA(LINHA_W, REG.IND_MOV_FIS, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.CHASSI);
    /* INCLUSAO DA OS 1065 */
    PROC_LINHA(LINHA_W, REG.NUM_DOCFIS_REF);
    PROC_LINHA(LINHA_W, REG.SERIE_DOCFIS_REF);
    PROC_LINHA(LINHA_W, REG.SSERIE_DOCFIS_REF);
    PROC_LINHA(LINHA_W, REG.VLR_BASE_PIS_ST);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_PIS_ST);
    PROC_LINHA(LINHA_W, REG.VLR_PIS_ST);
    PROC_LINHA(LINHA_W, REG.VLR_BASE_COFINS_ST);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_COFINS_ST);
    PROC_LINHA(LINHA_W, REG.VLR_COFINS_ST);
    PROC_LINHA(LINHA_W, REG.VLR_BASE_CSLL);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_CSLL);
    PROC_LINHA(LINHA_W, REG.VLR_CSLL);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_PIS);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_COFINS);
    PROC_LINHA(LINHA_W, REG.IND_FORNEC_ICMSS, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.IND_SITUACAO_ESP_ST);
    PROC_LINHA(LINHA_W, REG.VLR_ICMSS_NDESTAC);
    PROC_LINHA(LINHA_W, REG.IND_DOCTO_REC);
    PROC_LINHA(LINHA_W, REG.DAT_PGTO_GNRE_DARJ);
    PROC_LINHA(LINHA_W, REG.VLR_CUSTO_UNIT, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.QUANTIDADE_CONV, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.VLR_FECP_ICMS);
    PROC_LINHA(LINHA_W, REG.VLR_FECP_DIFALIQ);
    PROC_LINHA(LINHA_W, REG.VLR_FECP_ICMS_ST);
    PROC_LINHA(LINHA_W, REG.VLR_FECP_FONTE);
    PROC_LINHA(LINHA_W, REG.TRIB_ICMSS_AUX2, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.BASE_ICMSS_AUX2, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.VLR_BASE_ICMSS_N_ESCRIT, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.VLR_ICMSS_N_ESCRIT, 'N', 'N');

    -- OS 2020
    PROC_LINHA(LINHA_W, REG.COD_TRIB_IPI, 'N');
    PROC_LINHA(LINHA_W, REG.LOTE_MEDICAMENTO);
    PROC_LINHA(LINHA_W, REG.VALID_MEDICAMENTO, 'S', 'N');
    PROC_LINHA(LINHA_W, REG.IND_BASE_MEDICAMENTO, 'N');
    PROC_LINHA(LINHA_W, REG.VLR_PRECO_MEDICAMENTO, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.IND_TIPO_ARMA);
    PROC_LINHA(LINHA_W, REG.NUM_SERIE_ARMA);
    PROC_LINHA(LINHA_W, REG.NUM_CANO_ARMA);
    PROC_LINHA(LINHA_W, REG.DSC_ARMA);
    PROC_LINHA(LINHA_W, REG.COD_OBSERVACAO);

    /* OS 2191 */
    PROC_LINHA(LINHA_W, REG.COD_EX_NCM);
    PROC_LINHA(LINHA_W, REG.COD_EX_IMP);
    PROC_LINHA(LINHA_W, REG.CNPJ_OPERADORA);
    PROC_LINHA(LINHA_W, REG.CPF_OPERADORA);
    PROC_LINHA(LINHA_W, REG.UF_OPERADORA);
    PROC_LINHA(LINHA_W, REG.INS_EST_OPERADORA);
    PROC_LINHA(LINHA_W, REG.IND_ESPECIF_RECEITA);
    /* RESTANTE DA LINHA DO ARQUIVO TEXTO - ULTIMO CAMPO */
    PROC_LINHA(LINHA_W, REG.COD_CLASS_ITEM);

    PROC_LINHA(LINHA_W, REG.VLR_TERCEIROS);

    PROC_LINHA(LINHA_W, REG.VLR_PRECO_SUGER);

    --OS2302
    PROC_LINHA(LINHA_W, REG.VLR_BASE_CIDE);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_CIDE);
    PROC_LINHA(LINHA_W, REG.VLR_CIDE);
    --OS2315
    PROC_LINHA(LINHA_W, REG.COD_OPER_ESP_ST);
    --OS2403
    PROC_LINHA(LINHA_W, REG.VLR_COMISSAO);

    PROC_LINHA(LINHA_W, REG.VLR_ICMS_FRETE); -- OS 2379
    PROC_LINHA(LINHA_W, REG.VLR_DIFAL_FRETE); -- OS 2379

    PROC_LINHA(LINHA_W, REG.IND_VLR_PIS_COFINS); -- OS 2386
    PROC_LINHA(LINHA_W, REG.COD_ENQUAD_IPI); -- OS 2388-B
    PROC_LINHA(LINHA_W, REG.COD_SITUACAO_PIS); -- OS 2388-B
    PROC_LINHA(LINHA_W, REG.QTD_BASE_PIS); -- OS 2388-B
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_PIS_R); -- OS 2388-B
    PROC_LINHA(LINHA_W, REG.COD_SITUACAO_COFINS); -- OS 2388-B
    PROC_LINHA(LINHA_W, REG.QTD_BASE_COFINS); -- OS 2388-B
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_COFINS_R); -- OS 2388-B
    PROC_LINHA(LINHA_W, REG.ITEM_PORT_TARE); -- OS 2479
    PROC_LINHA(LINHA_W, REG.VLR_FUNRURAL); -- OS 2533
    PROC_LINHA(LINHA_W, REG.IND_TP_PROD_MEDIC); -- OS2388-Pdw

    PROC_LINHA(LINHA_W, REG.VLR_CUSTO_DCA); -- OS2933-B
    PROC_LINHA(LINHA_W, REG.COD_TP_LANCTO); -- OS2933-B
    PROC_LINHA(LINHA_W, REG.VLR_PERC_CRED_OUT); -- OS2933-B
    PROC_LINHA(LINHA_W, REG.VLR_CRED_OUT); -- OS2933-B
    PROC_LINHA(LINHA_W, REG.VLR_ICMS_DCA); -- OS2933-B

    PROC_LINHA(LINHA_W, REG.VLR_PIS_EXP); -- OS2388-B2
    PROC_LINHA(LINHA_W, REG.VLR_PIS_TRIB); -- OS2388-B2
    PROC_LINHA(LINHA_W, REG.VLR_PIS_N_TRIB); -- OS2388-B2
    PROC_LINHA(LINHA_W, REG.VLR_COFINS_EXP); -- OS2388-B2
    PROC_LINHA(LINHA_W, REG.VLR_COFINS_TRIB); -- OS2388-B2
    PROC_LINHA(LINHA_W, REG.VLR_COFINS_N_TRIB); -- OS2388-B2

    PROC_LINHA(LINHA_W, REG.COD_ENQ_LEGAL); -- OS2933-B1

    PROC_LINHA(LINHA_W, REG.DAT_LANC_PIS_COFINS); -- 3169-DW1
    PROC_LINHA(LINHA_W, REG.IND_PIS_COFINS_EXTEMP); -- 3169-DW1
    PROC_LINHA(LINHA_W, REG.IND_NATUREZA_FRETE); -- 3169-DW1

    PROC_LINHA(LINHA_W, REG.COD_NAT_REC); -- 3169-DW11
    PROC_LINHA(LINHA_W, REG.IND_NAT_BASE_CRED); -- 3169-GE13B
    PROC_LINHA(LINHA_W, REG.VLR_ACRESCIMO);
    PROC_LINHA(LINHA_W, REG.IND_IPI_NDESTAC_DF);
    -- OS 3521
    PROC_LINHA(LINHA_W, REG.DSC_RESERVADO1);
    PROC_LINHA(LINHA_W, REG.DSC_RESERVADO2);
    PROC_LINHA(LINHA_W, REG.DSC_RESERVADO3);

    PROC_LINHA(LINHA_W, REG.COD_TRIB_PROD); -- OS3663
    PROC_LINHA(LINHA_W, REG.DSC_RESERVADO4);
    PROC_LINHA(LINHA_W, REG.DSC_RESERVADO5);
    PROC_LINHA(LINHA_W, REG.DSC_RESERVADO6);
    PROC_LINHA(LINHA_W, REG.DSC_RESERVADO7);
    PROC_LINHA(LINHA_W, REG.DSC_RESERVADO8);
    PROC_LINHA(LINHA_W, REG.INDICE_PROD_ACAB);

    PROC_LINHA(LINHA_W, REG.VLR_BASE_DIA_AM);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_DIA_AM);
    PROC_LINHA(LINHA_W, REG.VLR_ICMS_DIA_AM);

    PROC_LINHA(LINHA_W, REG.VLR_ADUANEIRO);

    PROC_LINHA(LINHA_W, REG.COD_SITUACAO_PIS_ST);
    PROC_LINHA(LINHA_W, REG.COD_SITUACAO_COFINS_ST);

    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_DCIP);
    --MFS1750
    PROC_LINHA(LINHA_W, REG.NUM_LI);

    PROC_LINHA(LINHA_W, REG.VLR_FCP_UF_DEST); -- MFS2101
    PROC_LINHA(LINHA_W, REG.VLR_ICMS_UF_DEST); -- MFS2101
    PROC_LINHA(LINHA_W, REG.VLR_ICMS_UF_ORIG); -- MFS2101

    PROC_LINHA(LINHA_W, REG.VLR_DIF_DUB); --MFS3484
    --MFS4881
    PROC_LINHA(LINHA_W, REG.VLR_ICMS_NAO_DEST);
    PROC_LINHA(LINHA_W, REG.VLR_BASE_ICMS_NAO_DEST);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_ICMS_NAO_DEST);
    PROC_LINHA(LINHA_W, REG.IND_MOTIVO_RES);
    PROC_LINHA(LINHA_W, REG.NUM_DOCFIS_RET);
    PROC_LINHA(LINHA_W, REG.SERIE_DOCFIS_RET);
    PROC_LINHA(LINHA_W, REG.NUM_AUTENTIC_NFE_RET);
    PROC_LINHA(LINHA_W, REG.NUM_ITEM_RET);
    PROC_LINHA(LINHA_W, REG.IND_FIS_JUR_RET);
    PROC_LINHA(LINHA_W, REG.COD_FIS_JUR_RET);
    PROC_LINHA(LINHA_W, REG.IND_TP_DOC_ARREC);
    PROC_LINHA(LINHA_W, REG.NUM_DOC_ARREC);
    PROC_LINHA(LINHA_W, REG.COD_CFO_DCIP);

    PROC_LINHA(LINHA_W, REG.VLR_BASE_INSS);
    PROC_LINHA(LINHA_W, REG.VLR_INSS_RETIDO);
    PROC_LINHA(LINHA_W, REG.VLR_TOT_ADIC);
    PROC_LINHA(LINHA_W, REG.VLR_N_RET_PRINC);
    PROC_LINHA(LINHA_W, REG.VLR_N_RET_ADIC);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_INSS);
    PROC_LINHA(LINHA_W, REG.VLR_RET_SERV);
    PROC_LINHA(LINHA_W, REG.VLR_SERV_15);
    PROC_LINHA(LINHA_W, REG.VLR_SERV_20);
    PROC_LINHA(LINHA_W, REG.VLR_SERV_25);
    PROC_LINHA(LINHA_W, REG.IND_TP_PROC_ADJ_PRINC);
    PROC_LINHA(LINHA_W, REG.NUM_PROC_ADJ_PRINC);
    PROC_LINHA(LINHA_W, REG.COD_SUSP_PRINC);
    PROC_LINHA(LINHA_W, REG.IND_TP_PROC_ADJ_ADIC);
    PROC_LINHA(LINHA_W, REG.NUM_PROC_ADJ_ADIC);
    PROC_LINHA(LINHA_W, REG.COD_SUSP_ADIC);
    PROC_LINHA(LINHA_W, REG.VLR_IPI_DEV); --MFS20985
    PROC_LINHA(LINHA_W, REG.COD_BENEFICIO); --MFS20985
    PROC_LINHA(LINHA_W, REG.VLR_ABAT_NTRIBUTADO); --MFS20985
    PROC_LINHA(LINHA_W, REG.VLR_CREDITO_MVA_SN);
    PROC_LINHA(LINHA_W, REG.VLR_DESONERADO_ICMS);
    PROC_LINHA(LINHA_W, REG.VLR_DIFERIDO_ICMS);
    PROC_LINHA(LINHA_W, REG.VLR_EXC_BC_PIS);
    PROC_LINHA(LINHA_W, REG.VLR_EXC_BC_COFINS);
    PROC_LINHA(LINHA_W, REG.COD_CSOSN); --MFS40783
    PROC_LINHA(LINHA_W, REG.VLR_FECP_ALIQ_ICMS);

    INSERT INTO SAFX08
      (COD_EMPRESA,
       COD_ESTAB,
       DATA_FISCAL,
       MOVTO_E_S,
       NORM_DEV,
       COD_DOCTO,
       IND_FIS_JUR,
       COD_FIS_JUR,
       NUM_DOCFIS,
       SERIE_DOCFIS,
       SUB_SERIE_DOCFIS,
       IND_BEM_PATR,
       IND_PRODUTO,
       COD_PRODUTO,
       COD_BEM,
       COD_INC_BEM,
       COD_UND_PADRAO,
       NUM_ITEM,
       COD_ALMOX,
       COD_CUSTO,
       DESCRICAO_COMPL,
       COD_CFO,
       COD_NATUREZA_OP,
       QUANTIDADE,
       COD_MEDIDA,
       COD_NBM,
       VLR_UNIT,
       VLR_ITEM,
       VLR_DESCONTO,
       COD_SITUACAO_A,
       COD_SITUACAO_B,
       COD_FEDERAL,
       IND_IPI_INCLUSO,
       NUM_ROMANEIO,
       DATA_ROMANEIO,
       PESO_LIQUIDO,
       COD_INDICE,
       VLR_ITEM_CONVER,
       VLR_FRETE,
       VLR_SEGURO,
       VLR_OUTRAS,
       VLR_ALIQ_ICMS,
       VLR_ICMS,
       DIF_ALIQ_ICMS,
       OBS_ICMS,
       COD_APUR_ICMS,
       VLR_ALIQ_IPI,
       VLR_IPI,
       OBS_IPI,
       COD_APUR_IPI,
       VLR_ALIQ_SUB_ICMS,
       VLR_SUBST_ICMS,
       OBS_SUBST_ICMS,
       COD_APUR_SUB_ICMS,
       TRIB_ICMS,
       BASE_ICMS,
       BASE_REDU_ICMS,
       TRIB_IPI,
       BASE_IPI,
       BASE_REDU_IPI,
       BASE_SUB_TRIB_ICMS,
       VLR_CONTAB_COMPL,
       VLR_ALIQ_DESTINO,
       VLR_CONTAB_ITEM,
       COD_OBS_VCONT_COMP,
       COD_OBS_VCONT_ITEM,
       VLR_OUTROS_ICMS,
       VLR_OUTROS_IPI,
       VLR_OUTROS1,
       NUM_ATO_CONCES,
       DAT_EMBARQUE,
       NUM_REG_EXP,
       NUM_DESP_EXP,
       VLR_TOM_SERVICO,
       VLR_DESP_MOEDA_EXP,
       COD_MOEDA_NEGOC,
       COD_PAIS_DEST_ORIG,
       IND_CRED_ICMSS,
       COD_TRIB_INT,
       VLR_ICMS_NDESTAC,
       VLR_IPI_NDESTAC,
       TRIB_ICMS_AUX,
       BASE_ICMS_AUX,
       TRIB_IPI_AUX,
       BASE_IPI_AUX,
       VLR_BASE_PIS,
       VLR_PIS,
       VLR_BASE_COFINS,
       VLR_COFINS,
       BASE_ICMS_ORIGDEST,
       VLR_ICMS_ORIGDEST,
       ALIQ_ICMS_ORIGDEST,
       VLR_DESC_CONDIC,
       TRIB_ICMSS,
       BASE_REDU_ICMSS,
       VLR_CUSTO_TRANSF,
       PERC_RED_BASE_ICMS,
       QTD_EMBARCADA,
       DAT_REGISTRO_EXP,
       DAT_DESPACHO,
       DAT_AVERBACAO,
       DAT_DI,
       NUM_DEC_IMP_REF,
       DAT_GRAVACAO,
       DSC_MOT_OCOR,
       COD_CONTA,
       VLR_BASE_ICMS_ORIG,
       VLR_TRIB_ICMS_ORIG,
       VLR_BASE_ICMS_DEST,
       VLR_TRIB_ICMS_DEST,
       VLR_PERC_PRES_ICMS,
       VLR_PRECO_BASE_ST,
       COD_OPER_OIL,
       COD_DCR,
       COD_PROJETO,
       IND_MOV_FIS,
       CHASSI,
       NUM_DOCFIS_REF,
       SERIE_DOCFIS_REF,
       SSERIE_DOCFIS_REF,
       VLR_BASE_PIS_ST,
       VLR_ALIQ_PIS_ST,
       VLR_PIS_ST,
       VLR_BASE_COFINS_ST,
       VLR_ALIQ_COFINS_ST,
       VLR_COFINS_ST,
       VLR_BASE_CSLL,
       VLR_ALIQ_CSLL,
       VLR_CSLL,
       VLR_ALIQ_PIS,
       VLR_ALIQ_COFINS,
       IND_FORNEC_ICMSS,
       IND_SITUACAO_ESP_ST,
       VLR_ICMSS_NDESTAC,
       IND_DOCTO_REC,
       DAT_PGTO_GNRE_DARJ,
       VLR_CUSTO_UNIT,
       QUANTIDADE_CONV,
       VLR_FECP_FONTE,
       TRIB_ICMSS_AUX2,
       BASE_ICMSS_AUX2,
       VLR_BASE_ICMSS_N_ESCRIT,
       VLR_ICMSS_N_ESCRIT,
       COD_TRIB_IPI,
       LOTE_MEDICAMENTO,
       VALID_MEDICAMENTO,
       IND_BASE_MEDICAMENTO,
       VLR_PRECO_MEDICAMENTO,
       IND_TIPO_ARMA,
       NUM_SERIE_ARMA,
       NUM_CANO_ARMA,
       DSC_ARMA,
       COD_OBSERVACAO,
       COD_EX_NCM,
       COD_EX_IMP,
       CNPJ_OPERADORA,
       CPF_OPERADORA,
       UF_OPERADORA,
       INS_EST_OPERADORA,
       IND_ESPECIF_RECEITA,
       COD_CLASS_ITEM,
       VLR_PRECO_SUGER,
       VLR_TERCEIROS,
       VLR_BASE_CIDE, --OS2302
       VLR_ALIQ_CIDE, --OS2302
       VLR_CIDE, --OS2302
       COD_OPER_ESP_ST, --OS2315
       VLR_COMISSAO,
       VLR_ICMS_FRETE, -- OS2379
       VLR_DIFAL_FRETE,
       IND_VLR_PIS_COFINS,
       COD_ENQUAD_IPI,
       COD_SITUACAO_PIS, -- OS 2388-B
       QTD_BASE_PIS, -- OS 2388-B
       VLR_ALIQ_PIS_R, -- OS 2388-B
       COD_SITUACAO_COFINS, -- OS 2388-B
       QTD_BASE_COFINS, -- OS 2388-B
       VLR_ALIQ_COFINS_R, -- OS 2388-B ) -- OS2386
       ITEM_PORT_TARE, --OS2479
       VLR_FUNRURAL, --OS2355
       IND_TP_PROD_MEDIC, --OS2388-Pdw
       VLR_CUSTO_DCA, -- OS2933-B
       COD_TP_LANCTO, -- OS2933-B
       VLR_PERC_CRED_OUT, -- OS2933-B
       VLR_CRED_OUT, -- OS2933-B
       VLR_ICMS_DCA, -- OS2933-B
       VLR_PIS_EXP, -- OS2388-B2
       VLR_PIS_TRIB, -- OS2388-B2
       VLR_PIS_N_TRIB, -- OS2388-B2
       VLR_COFINS_EXP, -- OS2388-B2
       VLR_COFINS_TRIB, -- OS2388-B2
       VLR_COFINS_N_TRIB, -- OS2388-B2
       COD_ENQ_LEGAL, -- OS2933-B1
       DAT_LANC_PIS_COFINS, -- 3169-DW1
       IND_PIS_COFINS_EXTEMP, -- 3169-DW1
       IND_NATUREZA_FRETE, -- 3169-DW1
       COD_NAT_REC, -- 3169-DW11
       IND_NAT_BASE_CRED, --3169-GE13B
       VLR_ACRESCIMO,
       IND_IPI_NDESTAC_DF,
       DSC_RESERVADO1,
       DSC_RESERVADO2,
       DSC_RESERVADO3,
       COD_TRIB_PROD, -- OS3663
       DSC_RESERVADO4,
       DSC_RESERVADO5,
       DSC_RESERVADO6,
       DSC_RESERVADO7,
       DSC_RESERVADO8,
       INDICE_PROD_ACAB,
       VLR_BASE_DIA_AM,
       VLR_ALIQ_DIA_AM,
       VLR_ICMS_DIA_AM,
       VLR_ADUANEIRO,
       COD_SITUACAO_PIS_ST,
       COD_SITUACAO_COFINS_ST,
       VLR_ALIQ_DCIP,
       NUM_LI,
       VLR_FCP_UF_DEST, -- MFS2101
       VLR_ICMS_UF_DEST, -- MFS2101
       VLR_ICMS_UF_ORIG, -- MFS2101
       VLR_DIF_DUB
       -- MFS 4881
      ,
       VLR_ICMS_NAO_DEST,
       VLR_BASE_ICMS_NAO_DEST,
       VLR_ALIQ_ICMS_NAO_DEST,
       IND_MOTIVO_RES,
       NUM_DOCFIS_RET,
       SERIE_DOCFIS_RET,
       NUM_AUTENTIC_NFE_RET,
       NUM_ITEM_RET,
       IND_FIS_JUR_RET,
       COD_FIS_JUR_RET,
       IND_TP_DOC_ARREC,
       NUM_DOC_ARREC,
       COD_CFO_DCIP,
       VLR_BASE_INSS,
       VLR_INSS_RETIDO,
       VLR_TOT_ADIC,
       VLR_N_RET_PRINC,
       VLR_N_RET_ADIC,
       VLR_ALIQ_INSS,
       VLR_RET_SERV,
       VLR_SERV_15,
       VLR_SERV_20,
       VLR_SERV_25,
       IND_TP_PROC_ADJ_PRINC,
       NUM_PROC_ADJ_PRINC,
       COD_SUSP_PRINC,
       IND_TP_PROC_ADJ_ADIC,
       NUM_PROC_ADJ_ADIC,
       COD_SUSP_ADIC,
       VLR_IPI_DEV --MFS20985
      ,
       COD_BENEFICIO --MFS20985
      ,
       VLR_ABAT_NTRIBUTADO --MFS20985
      ,
       VLR_CREDITO_MVA_SN,
       VLR_DESONERADO_ICMS,
       VLR_DIFERIDO_ICMS,
       VLR_EXC_BC_PIS,
       VLR_EXC_BC_COFINS,
       COD_CSOSN --MFS
      ,
       VLR_FECP_ALIQ_ICMS,
       PST_ID)
    VALUES
      (REG.COD_EMPRESA,
       REG.COD_ESTAB,
       REG.DATA_FISCAL,
       REG.MOVTO_E_S,
       REG.NORM_DEV,
       REG.COD_DOCTO,
       REG.IND_FIS_JUR,
       REG.COD_FIS_JUR,
       REG.NUM_DOCFIS,
       NVL(REG.SERIE_DOCFIS,'@'),
       NVL(REG.SUB_SERIE_DOCFIS,'@'),
       REG.IND_BEM_PATR,
       REG.IND_PRODUTO,
       REG.COD_PRODUTO,
       REG.COD_BEM,
       REG.COD_INC_BEM,
       REG.COD_UND_PADRAO,
       REG.NUM_ITEM,
       REG.COD_ALMOX,
       REG.COD_CUSTO,
       REG.DESCRICAO_COMPL,
       REG.COD_CFO,
       REG.COD_NATUREZA_OP,
       REG.QUANTIDADE,
       REG.COD_MEDIDA,
       REG.COD_NBM,
       REG.VLR_UNIT,
       REG.VLR_ITEM,
       REG.VLR_DESCONTO,
       REG.COD_SITUACAO_A,
       REG.COD_SITUACAO_B,
       REG.COD_FEDERAL,
       REG.IND_IPI_INCLUSO,
       REG.NUM_ROMANEIO,
       REG.DATA_ROMANEIO,
       REG.PESO_LIQUIDO,
       REG.COD_INDICE,
       REG.VLR_ITEM_CONVER,
       REG.VLR_FRETE,
       REG.VLR_SEGURO,
       REG.VLR_OUTRAS,
       REG.VLR_ALIQ_ICMS,
       REG.VLR_ICMS,
       REG.DIF_ALIQ_ICMS,
       REG.OBS_ICMS,
       REG.COD_APUR_ICMS,
       REG.VLR_ALIQ_IPI,
       REG.VLR_IPI,
       REG.OBS_IPI,
       REG.COD_APUR_IPI,
       REG.VLR_ALIQ_SUB_ICMS,
       REG.VLR_SUBST_ICMS,
       REG.OBS_SUBST_ICMS,
       REG.COD_APUR_SUB_ICMS,
       REG.TRIB_ICMS,
       REG.BASE_ICMS,
       REG.BASE_REDU_ICMS,
       REG.TRIB_IPI,
       REG.BASE_IPI,
       REG.BASE_REDU_IPI,
       REG.BASE_SUB_TRIB_ICMS,
       REG.VLR_CONTAB_COMPL,
       REG.VLR_ALIQ_DESTINO,
       REG.VLR_CONTAB_ITEM,
       REG.COD_OBS_VCONT_COMP,
       REG.COD_OBS_VCONT_ITEM,
       REG.VLR_OUTROS_ICMS,
       REG.VLR_OUTROS_IPI,
       REG.VLR_OUTROS1,
       REG.NUM_ATO_CONCES,
       REG.DAT_EMBARQUE,
       REG.NUM_REG_EXP,
       REG.NUM_DESP_EXP,
       REG.VLR_TOM_SERVICO,
       REG.VLR_DESP_MOEDA_EXP,
       REG.COD_MOEDA_NEGOC,
       REG.COD_PAIS_DEST_ORIG,
       REG.IND_CRED_ICMSS,
       REG.COD_TRIB_INT,
       REG.VLR_ICMS_NDESTAC,
       REG.VLR_IPI_NDESTAC,
       REG.TRIB_ICMS_AUX,
       REG.BASE_ICMS_AUX,
       REG.TRIB_IPI_AUX,
       REG.BASE_IPI_AUX,
       REG.VLR_BASE_PIS,
       REG.VLR_PIS,
       REG.VLR_BASE_COFINS,
       REG.VLR_COFINS,
       REG.BASE_ICMS_ORIGDEST,
       REG.VLR_ICMS_ORIGDEST,
       REG.ALIQ_ICMS_ORIGDEST,
       REG.VLR_DESC_CONDIC,
       REG.TRIB_ICMSS,
       REG.BASE_REDU_ICMSS,
       REG.VLR_CUSTO_TRANSF,
       REG.PERC_RED_BASE_ICMS,
       REG.QTD_EMBARCADA,
       REG.DAT_REGISTRO_EXP,
       REG.DAT_DESPACHO,
       REG.DAT_AVERBACAO,
       REG.DAT_DI,
       REG.NUM_DEC_IMP_REF,
       SYSDATE,
       REG.DSC_MOT_OCOR,
       REG.COD_CONTA,
       REG.VLR_BASE_ICMS_ORIG,
       REG.VLR_TRIB_ICMS_ORIG,
       REG.VLR_BASE_ICMS_DEST,
       REG.VLR_TRIB_ICMS_DEST,
       REG.VLR_PERC_PRES_ICMS,
       REG.VLR_PRECO_BASE_ST,
       REG.COD_OPER_OIL,
       REG.COD_DCR,
       REG.COD_PROJETO,
       REG.IND_MOV_FIS,
       REG.CHASSI,
       REG.NUM_DOCFIS_REF,
       REG.SERIE_DOCFIS_REF,
       REG.SSERIE_DOCFIS_REF,
       REG.VLR_BASE_PIS_ST,
       REG.VLR_ALIQ_PIS_ST,
       REG.VLR_PIS_ST,
       REG.VLR_BASE_COFINS_ST,
       REG.VLR_ALIQ_COFINS_ST,
       REG.VLR_COFINS_ST,
       REG.VLR_BASE_CSLL,
       REG.VLR_ALIQ_CSLL,
       REG.VLR_CSLL,
       REG.VLR_ALIQ_PIS,
       REG.VLR_ALIQ_COFINS,
       REG.IND_FORNEC_ICMSS,
       REG.IND_SITUACAO_ESP_ST,
       REG.VLR_ICMSS_NDESTAC,
       REG.IND_DOCTO_REC,
       REG.DAT_PGTO_GNRE_DARJ,
       REG.VLR_CUSTO_UNIT,
       REG.QUANTIDADE_CONV,
       REG.VLR_FECP_FONTE,
       REG.TRIB_ICMSS_AUX2,
       REG.BASE_ICMSS_AUX2,
       REG.VLR_BASE_ICMSS_N_ESCRIT,
       REg.Vlr_Icmss_n_Escrit,
       REG.COD_TRIB_IPI,
       REG.LOTE_MEDICAMENTO,
       REG.VALID_MEDICAMENTO,
       REG.IND_BASE_MEDICAMENTO,
       REG.VLR_PRECO_MEDICAMENTO,
       REG.IND_TIPO_ARMA,
       REG.NUM_SERIE_ARMA,
       REG.NUM_CANO_ARMA,
       REG.DSC_ARMA,
       REG.COD_OBSERVACAO,
       REG.COD_EX_NCM,
       REG.COD_EX_IMP,
       REG.CNPJ_OPERADORA,
       REG.CPF_OPERADORA,
       REG.UF_OPERADORA,
       REG.INS_EST_OPERADORA,
       REG.IND_ESPECIF_RECEITA,
       REG.COD_CLASS_ITEM,
       REG.VLR_PRECO_SUGER,
       REG.VLR_TERCEIROS,
       REG.VLR_BASE_CIDE, --OS2302
       REG.VLR_ALIQ_CIDE, --OS2302
       REG.VLR_CIDE, --OS2302
       REG.COD_OPER_ESP_ST, --OS2315
       REG.VLR_COMISSAO,
       REG.VLR_ICMS_FRETE, -- OS2379
       REG.VLR_DIFAL_FRETE,
       REG.IND_VLR_PIS_COFINS,
       REG.COD_ENQUAD_IPI,
       REG.COD_SITUACAO_PIS, -- OS 2388-B
       REG.QTD_BASE_PIS, -- OS 2388-B
       REG.VLR_ALIQ_PIS_R, -- OS 2388-B
       REG.COD_SITUACAO_COFINS, -- OS 2388-B
       REG.QTD_BASE_COFINS, -- OS 2388-B
       REG.VLR_ALIQ_COFINS_R, -- OS 2388-B
       REG.ITEM_PORT_TARE, --OS2479
       REG.VLR_FUNRURAL,
       REG.IND_TP_PROD_MEDIC, --OS2388-Pdw
       REG.VLR_CUSTO_DCA, -- OS2933-B
       REG.COD_TP_LANCTO, -- OS2933-B
       REG.VLR_PERC_CRED_OUT, -- OS2933-B
       REG.VLR_CRED_OUT, -- OS2933-B
       REG.VLR_ICMS_DCA, -- OS2933-B
       REG.VLR_PIS_EXP, -- OS2388-B2
       REG.VLR_PIS_TRIB, -- OS2388-B2
       REG.VLR_PIS_N_TRIB, -- OS2388-B2
       REG.VLR_COFINS_EXP, -- OS2388-B2
       REG.VLR_COFINS_TRIB, -- OS2388-B2
       REG.VLR_COFINS_N_TRIB, -- OS2388-B2
       REG.COD_ENQ_LEGAL,
       REG.DAT_LANC_PIS_COFINS, -- 3169-DW1
       REG.IND_PIS_COFINS_EXTEMP, -- 3169-DW1
       REG.IND_NATUREZA_FRETE, -- 3169-DW1
       REG.COD_NAT_REC, -- 3169-DW11
       REG.IND_NAT_BASE_CRED,
       REG.VLR_ACRESCIMO,
       REG.IND_IPI_NDESTAC_DF,
       REG.DSC_RESERVADO1,
       REG.DSC_RESERVADO2,
       REG.DSC_RESERVADO3,
       REG.COD_TRIB_PROD, -- OS3663
       REG.DSC_RESERVADO4,
       REG.DSC_RESERVADO5,
       REG.DSC_RESERVADO6,
       REG.DSC_RESERVADO7,
       REG.DSC_RESERVADO8,
       REG.INDICE_PROD_ACAB,
       REG.VLR_BASE_DIA_AM,
       REG.VLR_ALIQ_DIA_AM,
       REG.VLR_ICMS_DIA_AM,
       REG.VLR_ADUANEIRO,
       REG.COD_SITUACAO_PIS_ST,
       REG.COD_SITUACAO_COFINS_ST,
       REG.VLR_ALIQ_DCIP,
       REG.NUM_LI,
       REG.VLR_FCP_UF_DEST, -- MFS2101
       REG.VLR_ICMS_UF_DEST, -- MFS2101
       REG.VLR_ICMS_UF_ORIG,
       REG.VLR_DIF_DUB -- MFS3484
       --MFS4881
      ,
       REG.VLR_ICMS_NAO_DEST -- MFS 4881
      ,
       REG.VLR_BASE_ICMS_NAO_DEST,
       REG.VLR_ALIQ_ICMS_NAO_DEST,
       REG.IND_MOTIVO_RES,
       REG.NUM_DOCFIS_RET,
       REG.SERIE_DOCFIS_RET,
       REG.NUM_AUTENTIC_NFE_RET,
       REG.NUM_ITEM_RET,
       REG.IND_FIS_JUR_RET,
       REG.COD_FIS_JUR_RET,
       REG.IND_TP_DOC_ARREC,
       REG.NUM_DOC_ARREC,
       REG.COD_CFO_DCIP,
       REG.VLR_BASE_INSS,
       REG.VLR_INSS_RETIDO,
       REG.VLR_TOT_ADIC,
       REG.VLR_N_RET_PRINC,
       REG.VLR_N_RET_ADIC,
       REG.VLR_ALIQ_INSS,
       REG.VLR_RET_SERV,
       REG.VLR_SERV_15,
       REG.VLR_SERV_20,
       REG.VLR_SERV_25,
       REG.IND_TP_PROC_ADJ_PRINC,
       REG.NUM_PROC_ADJ_PRINC,
       REG.COD_SUSP_PRINC,
       REG.IND_TP_PROC_ADJ_ADIC,
       REG.NUM_PROC_ADJ_ADIC,
       REG.COD_SUSP_ADIC,
       REG.VLR_IPI_DEV, --MFS20985
       REG.COD_BENEFICIO, --MFS20985
       REG.VLR_ABAT_NTRIBUTADO, --MFS20985
       REG.VLR_CREDITO_MVA_SN,
       REG.VLR_DESONERADO_ICMS,
       REG.VLR_DIFERIDO_ICMS,
       REG.VLR_EXC_BC_PIS,
       REG.VLR_EXC_BC_COFINS,
       REG.COD_CSOSN, --MFS40783
       REG.VLR_FECP_ALIQ_ICMS,
       P_PROCESSO)
       
       RETURNING ROWID INTO v_rowid_retorno;
       
       RETURN v_rowid_retorno;

  end INSERT_LINE_SAFX08;

  FUNCTION INSERT_LINE_SAFX09(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID IS

    /* VETOR DA SAFX */
    REG SAFX09%ROWTYPE;
    
    v_rowid_retorno ROWID;

  BEGIN

    Linha_w := pstrLinha;
    PROC_LINHA(LINHA_W, REG.COD_EMPRESA);
    PROC_LINHA(LINHA_W, REG.COD_ESTAB);
    PROC_LINHA(LINHA_W, REG.DATA_FISCAL, 'S');
    PROC_LINHA(LINHA_W, REG.MOVTO_E_S, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.NORM_DEV, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_DOCTO);
    PROC_LINHA(LINHA_W, REG.IND_FIS_JUR, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_FIS_JUR);
    PROC_LINHA(LINHA_W, REG.NUM_DOCFIS);
    PROC_LINHA(LINHA_W, REG.SERIE_DOCFIS);
    PROC_LINHA(LINHA_W, REG.SUB_SERIE_DOCFIS);
    PROC_LINHA(LINHA_W, REG.COD_SERVICO);
    PROC_LINHA(LINHA_W, REG.NUM_ITEM);
    PROC_LINHA(LINHA_W, REG.VLR_SERVICO);
    PROC_LINHA(LINHA_W, REG.VLR_TOT);
    PROC_LINHA(LINHA_W, REG.DESCRICAO_COMPL);
    PROC_LINHA(LINHA_W, REG.COD_CFO);
    PROC_LINHA(LINHA_W, REG.COD_NATUREZA_OP);
    PROC_LINHA(LINHA_W, REG.QUANTIDADE);
    PROC_LINHA(LINHA_W, REG.VLR_UNIT);
    PROC_LINHA(LINHA_W, REG.VLR_DESCONTO);
    PROC_LINHA(LINHA_W, REG.CONTRATO);
    PROC_LINHA(LINHA_W, REG.COD_INDICE);
    PROC_LINHA(LINHA_W, REG.VLR_SERVICO_CONV);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_ICMS);
    PROC_LINHA(LINHA_W, REG.VLR_ICMS);
    PROC_LINHA(LINHA_W, REG.DIF_ALIQ_ICMS);
    PROC_LINHA(LINHA_W, REG.OBS_ICMS);
    PROC_LINHA(LINHA_W, REG.COD_APUR_ICMS);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_IR);
    PROC_LINHA(LINHA_W, REG.VLR_IR);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_ISS);
    PROC_LINHA(LINHA_W, REG.VLR_ISS);
    PROC_LINHA(LINHA_W, REG.TRIB_ICMS, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.BASE_ICMS);
    PROC_LINHA(LINHA_W, REG.TRIB_IR, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.BASE_IR);
    PROC_LINHA(LINHA_W, REG.TRIB_ISS, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.BASE_ISS);
    PROC_LINHA(LINHA_W, REG.IND_PRODUTO, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_PRODUTO);
    PROC_LINHA(LINHA_W, REG.COMPL_ISENCAO);
    PROC_LINHA(LINHA_W, REG.VLR_BASE_CSLL);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_CSLL);
    PROC_LINHA(LINHA_W, REG.VLR_CSLL);
    PROC_LINHA(LINHA_W, REG.VLR_BASE_PIS);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_PIS);
    PROC_LINHA(LINHA_W, REG.VLR_PIS);
    PROC_LINHA(LINHA_W, REG.VLR_BASE_COFINS);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_COFINS);
    PROC_LINHA(LINHA_W, REG.VLR_COFINS);
    PROC_LINHA(LINHA_W, REG.COD_CONTA);
    PROC_LINHA(LINHA_W, REG.COD_OBSERVACAO);
    PROC_LINHA(LINHA_W, REG.COD_TRIB_ISS);
    PROC_LINHA(LINHA_W, REG.VLR_MAT_PROP);
    PROC_LINHA(LINHA_W, REG.VLR_MAT_TERC);
    PROC_LINHA(LINHA_W, REG.VLR_BASE_ISS_RETIDO);
    PROC_LINHA(LINHA_W, REG.VLR_ISS_RETIDO);
    PROC_LINHA(LINHA_W, REG.VLR_DEDUCAO_ISS);
    PROC_LINHA(LINHA_W, REG.VLR_SUBEMPR_ISS);
    PROC_LINHA(LINHA_W, REG.COD_CFPS);
    PROC_LINHA(LINHA_W, REG.VLR_OUT_DESP);
    PROC_LINHA(LINHA_W, REG.VLR_BASE_CIDE); --OS2302
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_CIDE); --OS2302
    PROC_LINHA(LINHA_W, REG.VLR_CIDE); --OS2302

    PROC_LINHA(LINHA_W, REG.VLR_COMISSAO); --OS2403

    PROC_LINHA(LINHA_W, REG.IND_VLR_PIS_COFINS); --OS2386

    PROC_LINHA(LINHA_W, REG.COD_SITUACAO_PIS); --OS2388-B2
    PROC_LINHA(LINHA_W, REG.COD_SITUACAO_COFINS); --OS2388-B2
    PROC_LINHA(LINHA_W, REG.VLR_PIS_EXP); --OS2388-B2
    PROC_LINHA(LINHA_W, REG.VLR_PIS_TRIB); --OS2388-B2
    PROC_LINHA(LINHA_W, REG.VLR_PIS_N_TRIB); --OS2388-B2
    PROC_LINHA(LINHA_W, REG.VLR_COFINS_EXP); --OS2388-B2
    PROC_LINHA(LINHA_W, REG.VLR_COFINS_TRIB); --OS2388-B2
    /* RESTANTE DA LINHA DO ARQUIVO TEXTO - ULTIMO CAMPO */
    PROC_LINHA(LINHA_W, REG.VLR_COFINS_N_TRIB); --OS2388-B2
    PROC_LINHA(LINHA_W, REG.VLR_BASE_INSS);
    PROC_LINHA(LINHA_W, REG.VLR_INSS_RETIDO);
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_INSS);
    PROC_LINHA(LINHA_W, REG.VLR_PIS_RETIDO); -- 3169-DW1
    PROC_LINHA(LINHA_W, REG.VLR_COFINS_RETIDO); -- 3169-DW1
    PROC_LINHA(LINHA_W, REG.DAT_LANC_PIS_COFINS); -- 3169-DW1
    PROC_LINHA(LINHA_W, REG.IND_PIS_COFINS_EXTEMP); -- 3169-DW1
    PROC_LINHA(LINHA_W, REG.IND_LOCAL_EXEC_SERV); -- 3169-DW1
    PROC_LINHA(LINHA_W, REG.COD_CUSTO); -- 3169-DW1

    PROC_LINHA(LINHA_W, REG.COD_NAT_REC); -- 3169-DW11
    PROC_LINHA(LINHA_W, REG.IND_NAT_BASE_CRED); -- 3169-GE13B
    PROC_LINHA(LINHA_W, REG.VLR_ACRESCIMO);
    -- OS 3521
    PROC_LINHA(LINHA_W, REG.DSC_RESERVADO1);
    PROC_LINHA(LINHA_W, REG.DSC_RESERVADO2);
    PROC_LINHA(LINHA_W, REG.DSC_RESERVADO3);

    PROC_LINHA(LINHA_W, REG.COD_NBS); -- OS3924

    PROC_LINHA(LINHA_W, REG.VLR_TOT_ADIC); -- OS4514
    PROC_LINHA(LINHA_W, REG.VLR_TOT_RET); -- OS4514
    PROC_LINHA(LINHA_W, REG.VLR_DEDUCAO_NF); -- OS4514
    PROC_LINHA(LINHA_W, REG.VLR_RET_NF); -- OS4514
    PROC_LINHA(LINHA_W, REG.VLR_RET_SERV); -- OS4514
    PROC_LINHA(LINHA_W, REG.VLR_ALIQ_ISS_RETIDO); -- OS4514
    PROC_LINHA(LINHA_W, REG.COD_SIT_TRIB_ISS); -- OS4667
    PROC_LINHA(LINHA_W, REG.VLR_N_RET_PRINC); -- OS8798
    PROC_LINHA(LINHA_W, REG.VLR_N_RET_ADIC); -- OS8798
    PROC_LINHA(LINHA_W, REG.VLR_DED_ALIM); -- OS8798
    PROC_LINHA(LINHA_W, REG.VLR_DED_TRANS); -- OS8798

    PROC_LINHA(LINHA_W, REG.IND_TP_PROC_ADJ_PRINC); --
    PROC_LINHA(LINHA_W, REG.NUM_PROC_ADJ_PRINC); --
    PROC_LINHA(LINHA_W, REG.COD_SUSP_PRINC); --  MFS 10357 REINF
    PROC_LINHA(LINHA_W, REG.IND_TP_PROC_ADJ_ADIC); --
    PROC_LINHA(LINHA_W, REG.NUM_PROC_ADJ_ADIC); --
    PROC_LINHA(LINHA_W, REG.COD_SUSP_ADIC); --

    PROC_LINHA(LINHA_W, REG.VLR_SERV_15);
    PROC_LINHA(LINHA_W, REG.VLR_SERV_20);
    PROC_LINHA(LINHA_W, REG.VLR_SERV_25);
    PROC_LINHA(LINHA_W, REG.VLR_ABAT_NTRIBUTADO); --MFS20985
    PROC_LINHA(LINHA_W, REG.COD_ATIV_RJ); --MFS31367

    PROC_LINHA(LINHA_W, REG.DSC_RESERVADO4);
    PROC_LINHA(LINHA_W, REG.DSC_RESERVADO5);
    PROC_LINHA(LINHA_W, REG.DSC_RESERVADO6);
    PROC_LINHA(LINHA_W, REG.DSC_RESERVADO7);
    PROC_LINHA(LINHA_W, REG.DSC_RESERVADO8);

    INSERT INTO SAFX09
      (COD_EMPRESA,
       COD_ESTAB,
       DATA_FISCAL,
       MOVTO_E_S,
       NORM_DEV,
       COD_DOCTO,
       IND_FIS_JUR,
       COD_FIS_JUR,
       NUM_DOCFIS,
       SERIE_DOCFIS,
       SUB_SERIE_DOCFIS,
       COD_SERVICO,
       NUM_ITEM,
       VLR_SERVICO,
       VLR_TOT,
       DESCRICAO_COMPL,
       COD_CFO,
       COD_NATUREZA_OP,
       QUANTIDADE,
       VLR_UNIT,
       VLR_DESCONTO,
       CONTRATO,
       COD_INDICE,
       VLR_SERVICO_CONV,
       VLR_ALIQ_ICMS,
       VLR_ICMS,
       DIF_ALIQ_ICMS,
       OBS_ICMS,
       COD_APUR_ICMS,
       VLR_ALIQ_IR,
       VLR_IR,
       VLR_ALIQ_ISS,
       VLR_ISS,
       TRIB_ICMS,
       BASE_ICMS,
       TRIB_IR,
       BASE_IR,
       TRIB_ISS,
       BASE_ISS,
       IND_PRODUTO,
       COD_PRODUTO,
       COMPL_ISENCAO,
       VLR_BASE_CSLL,
       VLR_ALIQ_CSLL,
       VLR_CSLL,
       VLR_BASE_PIS,
       VLR_ALIQ_PIS,
       VLR_PIS,
       VLR_BASE_COFINS,
       VLR_ALIQ_COFINS,
       VLR_COFINS,
       DAT_GRAVACAO,
       COD_CONTA,
       COD_OBSERVACAO,
       COD_TRIB_ISS,
       VLR_MAT_PROP,
       VLR_MAT_TERC,
       VLR_BASE_ISS_RETIDO,
       VLR_ISS_RETIDO,
       VLR_DEDUCAO_ISS,
       VLR_SUBEMPR_ISS,
       COD_CFPS,
       VLR_OUT_DESP,
       VLR_BASE_CIDE, --OS2302
       VLR_ALIQ_CIDE, --OS2302
       VLR_CIDE, --OS2302
       VLR_COMISSAO, --OS2403
       IND_VLR_PIS_COFINS,
       IND_ATO_COTEPE,
       COD_SITUACAO_PIS, --OS2388-B2
       COD_SITUACAO_COFINS, --OS2388-B2
       VLR_PIS_EXP, --OS2388-B2
       VLR_PIS_TRIB, --OS2388-B2
       VLR_PIS_N_TRIB, --OS2388-B2
       VLR_COFINS_EXP, --OS2388-B2
       VLR_COFINS_TRIB, --OS2388-B2
       VLR_COFINS_N_TRIB, --OS2388-B2
       VLR_BASE_INSS,
       VLR_ALIQ_INSS,
       VLR_INSS_RETIDO,
       VLR_PIS_RETIDO, -- 3169-DW1
       VLR_COFINS_RETIDO, -- 3169-DW1
       DAT_LANC_PIS_COFINS, -- 3169-DW1
       IND_PIS_COFINS_EXTEMP, -- 3169-DW1
       IND_LOCAL_EXEC_SERV, -- 3169-DW1
       COD_CUSTO, -- 3169-DW1
       COD_NAT_REC, -- 3169-DW11
       IND_NAT_BASE_CRED, -- 3169-GE13B
       VLR_ACRESCIMO,
       DSC_RESERVADO1,
       DSC_RESERVADO2,
       DSC_RESERVADO3,
       COD_NBS, -- OS3924

       VLR_TOT_ADIC, -- OS4514
       VLR_TOT_RET, -- OS4514
       VLR_DEDUCAO_NF, -- OS4514
       VLR_RET_NF, -- OS4514
       VLR_RET_SERV, -- OS4514
       VLR_ALIQ_ISS_RETIDO, --OS4226
       COD_SIT_TRIB_ISS,
       VLR_N_RET_PRINC, --MFS8798
       VLR_N_RET_ADIC,
       VLR_DED_ALIM,
       VLR_DED_TRANS,

       IND_TP_PROC_ADJ_PRINC, --
       NUM_PROC_ADJ_PRINC, --
       COD_SUSP_PRINC, -- MFS 10357 REINF
       IND_TP_PROC_ADJ_ADIC, --
       NUM_PROC_ADJ_ADIC, --
       COD_SUSP_ADIC, --

       VLR_SERV_15,
       VLR_SERV_20,
       VLR_SERV_25,
       VLR_ABAT_NTRIBUTADO, --MFS20985
       COD_ATIV_RJ, --MFS31367
       DSC_RESERVADO4,
       DSC_RESERVADO5,
       DSC_RESERVADO6,
       DSC_RESERVADO7,
       DSC_RESERVADO8,
       PST_ID
       )

    VALUES
      (REG.COD_EMPRESA,
       REG.COD_ESTAB,
       REG.DATA_FISCAL,
       REG.MOVTO_E_S,
       REG.NORM_DEV,
       REG.COD_DOCTO,
       REG.IND_FIS_JUR,
       REG.COD_FIS_JUR,
       REG.NUM_DOCFIS,
       NVL(REG.SERIE_DOCFIS,'@'),
       NVL(REG.SUB_SERIE_DOCFIS,'@'),
       REG.COD_SERVICO,
       REG.NUM_ITEM,
       REG.VLR_SERVICO,
       REG.VLR_TOT,
       REG.DESCRICAO_COMPL,
       REG.COD_CFO,
       REG.COD_NATUREZA_OP,
       REG.QUANTIDADE,
       REG.VLR_UNIT,
       REG.VLR_DESCONTO,
       REG.CONTRATO,
       REG.COD_INDICE,
       REG.VLR_SERVICO_CONV,
       REG.VLR_ALIQ_ICMS,
       REG.VLR_ICMS,
       REG.DIF_ALIQ_ICMS,
       REG.OBS_ICMS,
       REG.COD_APUR_ICMS,
       REG.VLR_ALIQ_IR,
       REG.VLR_IR,
       REG.VLR_ALIQ_ISS,
       REG.VLR_ISS,
       REG.TRIB_ICMS,
       REG.BASE_ICMS,
       REG.TRIB_IR,
       REG.BASE_IR,
       REG.TRIB_ISS,
       REG.BASE_ISS,
       REG.IND_PRODUTO,
       REG.COD_PRODUTO,
       REG.COMPL_ISENCAO,
       REG.VLR_BASE_CSLL,
       REG.VLR_ALIQ_CSLL,
       REG.VLR_CSLL,
       REG.VLR_BASE_PIS,
       REG.VLR_ALIQ_PIS,
       REG.VLR_PIS,
       REG.VLR_BASE_COFINS,
       REG.VLR_ALIQ_COFINS,
       REG.VLR_COFINS,
       SYSDATE,
       REG.COD_CONTA,
       REG.COD_OBSERVACAO,
       REG.COD_TRIB_ISS,
       REG.VLR_MAT_PROP,
       REG.VLR_MAT_TERC,
       REG.VLR_BASE_ISS_RETIDO,
       REG.VLR_ISS_RETIDO,
       REG.VLR_DEDUCAO_ISS,
       REG.VLR_SUBEMPR_ISS,
       REG.COD_CFPS,
       REG.VLR_OUT_DESP,
       REG.VLR_BASE_CIDE, --OS2302
       REG.VLR_ALIQ_CIDE, --OS2302
       REG.VLR_CIDE, --OS2302
       REG.VLR_COMISSAO, --OS2403
       REG.IND_VLR_PIS_COFINS,
       nvl(decode(REG.IND_ATO_COTEPE, '@', 'N'), 'N'), --CH34383
       REG.COD_SITUACAO_PIS, --OS2388-B2
       REG.COD_SITUACAO_COFINS, --OS2388-B2
       REG.VLR_PIS_EXP, --OS2388-B2
       REG.VLR_PIS_TRIB, --OS2388-B2
       REG.VLR_PIS_N_TRIB, --OS2388-B2
       REG.VLR_COFINS_EXP, --OS2388-B2
       REG.VLR_COFINS_TRIB, --OS2388-B2
       REG.VLR_COFINS_N_TRIB, --OS2388-B2
       REG.VLR_BASE_INSS,
       REG.VLR_ALIQ_INSS,
       REG.VLR_INSS_RETIDO,
       REG.VLR_PIS_RETIDO, -- 3169-DW1
       REG.VLR_COFINS_RETIDO, -- 3169-DW1
       REG.DAT_LANC_PIS_COFINS, -- 3169-DW1
       REG.IND_PIS_COFINS_EXTEMP, -- 3169-DW1
       REG.IND_LOCAL_EXEC_SERV, -- 3169-DW1
       REG.COD_CUSTO, -- 3169-DW1
       REG.COD_NAT_REC, -- 3169-DW11
       REG.IND_NAT_BASE_CRED, -- 3169-GE13B
       REG.VLR_ACRESCIMO,
       REG.DSC_RESERVADO1,
       REG.DSC_RESERVADO2,
       REG.DSC_RESERVADO3,
       REG.COD_NBS, -- OS3924

       REG.VLR_TOT_ADIC, -- OS4514
       REG.VLR_TOT_RET, -- OS4514
       REG.VLR_DEDUCAO_NF, -- OS4514
       REG.VLR_RET_NF, -- OS4514
       REG.VLR_RET_SERV, -- OS4514
       REG.VLR_ALIQ_ISS_RETIDO, -- OS4226,
       REG.COD_SIT_TRIB_ISS, -- OS4667
       REG.VLR_N_RET_PRINC,
       REG.VLR_N_RET_ADIC,
       REG.VLR_DED_ALIM,
       REG.VLR_DED_TRANS,

       REG.IND_TP_PROC_ADJ_PRINC, --
       REG.NUM_PROC_ADJ_PRINC, --
       REG.COD_SUSP_PRINC, -- MFS 10357 REINF
       REG.IND_TP_PROC_ADJ_ADIC, --
       REG.NUM_PROC_ADJ_ADIC, --
       REG.COD_SUSP_ADIC, --

       REG.VLR_SERV_15,
       REG.VLR_SERV_20,
       REG.VLR_SERV_25,
       REG.VLR_ABAT_NTRIBUTADO, --MFS20985
       REG.COD_ATIV_RJ, --MFS31367
       REG.DSC_RESERVADO4,
       REG.DSC_RESERVADO5,
       REG.DSC_RESERVADO6,
       REG.DSC_RESERVADO7,
       REG.DSC_RESERVADO8,
       P_PROCESSO)
       
       RETURNING ROWID INTO v_rowid_retorno;
       
       RETURN v_rowid_retorno;

  end INSERT_LINE_SAFX09;


FUNCTION INSERT_LINE_SAFX10(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID IS

    /* VETOR DA SAFX */
    REG SAFX10%ROWTYPE;
    
    v_rowid_retorno ROWID;

  BEGIN

    Linha_w := pstrLinha;
      PROC_LINHA(LINHA_W, REG.MOVTO_E_S, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.NORM_DEV, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.GRUPO_CONTAGEM, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.COD_DOCTO);
      PROC_LINHA(LINHA_W, REG.DATA_MOVTO, 'S');
      PROC_LINHA(LINHA_W, REG.NUM_DOCTO);
      PROC_LINHA(LINHA_W, REG.SERIE_DOCFIS);
      PROC_LINHA(LINHA_W, REG.SUB_SERIE_DOCFIS);
      PROC_LINHA(LINHA_W, REG.IND_PRODUTO, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.COD_PRODUTO);
      PROC_LINHA(LINHA_W, REG.COD_UND_PADRAO);
      PROC_LINHA(LINHA_W, REG.COD_ALMOX);
      PROC_LINHA(LINHA_W, REG.COD_CUSTO);
      PROC_LINHA(LINHA_W, REG.NUM_ITEM);
      PROC_LINHA(LINHA_W, REG.COD_NAT_ESTOQUE);
      PROC_LINHA(LINHA_W, REG.CONTRATO);
      PROC_LINHA(LINHA_W, REG.SERIE_ITEM);
      PROC_LINHA(LINHA_W, REG.QTD_MOVTO);
      PROC_LINHA(LINHA_W, REG.PRECO_UNIT);
      PROC_LINHA(LINHA_W, REG.PRECO_ITEM);
      PROC_LINHA(LINHA_W, REG.CUSTO_UNIT);
      PROC_LINHA(LINHA_W, REG.CUSTO_ITEM);
      PROC_LINHA(LINHA_W, REG.COD_CONTA_CRED);
      PROC_LINHA(LINHA_W, REG.COD_CONTA_DEBITO);
      PROC_LINHA(LINHA_W, REG.COD_OPERACAO);
      PROC_LINHA(LINHA_W, REG.COD_CFO);
      PROC_LINHA(LINHA_W, REG.COD_ENT_SAIDA);
      PROC_LINHA(LINHA_W, REG.VLR_IPI);
      PROC_LINHA(LINHA_W, REG.OBS_ESTOQUE);
      PROC_LINHA(LINHA_W, REG.DATA_ESCRITA_FIS, 'S');
      PROC_LINHA(LINHA_W, REG.COD_MEDIDA);
      PROC_LINHA(LINHA_W, REG.COD_NBM);
      PROC_LINHA(LINHA_W, REG.IND_INSUMO, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.COD_LEGENDA);
      PROC_LINHA(LINHA_W, REG.NUM_ORDEM);
      PROC_LINHA(LINHA_W, REG.NUM_DOCFIS_OFIC);
      PROC_LINHA(LINHA_W, REG.SERIE_DOCFIS_OFIC);
      PROC_LINHA(LINHA_W, REG.S_SERIE_DOCFIS_OFIC);
      PROC_LINHA(LINHA_W, REG.IND_FIS_JUR, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.COD_FIS_JUR);
      PROC_LINHA(LINHA_W, REG.IND_TP_MOVTO, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.INSC_ESTADUAL);
      PROC_LINHA(LINHA_W, REG.IND_PRODUTO_RASTRO);
      PROC_LINHA(LINHA_W, REG.COD_PRODUTO_RASTRO);
      PROC_LINHA(LINHA_W, REG.VLR_ICMS);
      PROC_LINHA(LINHA_W, REG.DATA_DISP, 'S');
      PROC_LINHA(LINHA_W, REG.IND_DOC_OPER, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.IND_TP_DOC_INTERNO);
      PROC_LINHA(LINHA_W, REG.IND_REDESIGNACAO);
      PROC_LINHA(LINHA_W, REG.IND_PRODUTO_ORI);
      PROC_LINHA(LINHA_W, REG.COD_PRODUTO_ORI);
      PROC_LINHA(LINHA_W, REG.VLR_CUSTO_DCA);
      PROC_LINHA(LINHA_W, REG.VLR_OUT_TRIB_NCUMUL);
      PROC_LINHA(LINHA_W, REG.COD_TP_LANCTO);
      PROC_LINHA(LINHA_W, REG.VLR_ICMS_DCA);
      PROC_LINHA(LINHA_W, REG.COD_DIF_PRODUCAO);
      PROC_LINHA(LINHA_W, REG.DSC_FINALIDADE);
      PROC_LINHA(LINHA_W, REG.COD_TIPO_MOV_EST);
      PROC_LINHA(LINHA_W, REG.COD_MEDIDA_ORI);
      PROC_LINHA(LINHA_W, REG.COD_NIVEL_PRODUTO);
      PROC_LINHA(LINHA_W, REG.QTD_INSUMO);
      --RESTANTE DA LINHA DO ARQUIVO TEXTO - ULTIMO CAMPO
      PROC_LINHA(LINHA_W, REG.IND_CF);

    INSERT INTO SAFX10(COD_EMPRESA,
                       COD_ESTAB,
                       MOVTO_E_S,
                       NORM_DEV,
                       GRUPO_CONTAGEM,
                       COD_DOCTO,
                       DATA_MOVTO,
                       NUM_DOCTO,
                       SERIE_DOCFIS,
                       SUB_SERIE_DOCFIS,
                       IND_PRODUTO,
                       COD_PRODUTO,
                       COD_UND_PADRAO,
                       COD_ALMOX,
                       COD_CUSTO,
                       NUM_ITEM,
                       COD_NAT_ESTOQUE,
                       CONTRATO,
                       SERIE_ITEM,
                       QTD_MOVTO,
                       PRECO_UNIT,
                       PRECO_ITEM,
                       CUSTO_UNIT,
                       CUSTO_ITEM,
                       COD_CONTA_CRED,
                       COD_CONTA_DEBITO,
                       COD_OPERACAO,
                       COD_CFO,
                       COD_ENT_SAIDA,
                       VLR_IPI,
                       OBS_ESTOQUE,
                       DATA_ESCRITA_FIS,
                       COD_MEDIDA,
                       COD_NBM,
                       IND_INSUMO,
                       COD_LEGENDA,
                       NUM_ORDEM,
                       NUM_DOCFIS_OFIC,
                       SERIE_DOCFIS_OFIC,
                       S_SERIE_DOCFIS_OFIC,
                       DAT_GRAVACAO,
                       IND_FIS_JUR,
                       COD_FIS_JUR,
                       IND_TP_MOVTO,
                       INSC_ESTADUAL,
                       IND_PRODUTO_RASTRO,
                       COD_PRODUTO_RASTRO,
                       VLR_ICMS,
                       DATA_DISP,
                       IND_DOC_OPER,
                       IND_TP_DOC_INTERNO,
                       IND_ATO_COTEPE,
                       IND_REDESIGNACAO,
                       IND_PRODUTO_ORI,
                       COD_PRODUTO_ORI,
                       VLR_CUSTO_DCA,
                       VLR_OUT_TRIB_NCUMUL,
                       COD_TP_LANCTO,
                       VLR_ICMS_DCA,
                       COD_DIF_PRODUCAO,
                       DSC_FINALIDADE,
                       COD_TIPO_MOV_EST,
                       COD_MEDIDA_ORI,
                       COD_NIVEL_PRODUTO,
                       QTD_INSUMO,
                       PST_ID,
                       NUM_LOTE,
                       IND_CF)
    VALUES (REG.COD_EMPRESA,
              REG.COD_ESTAB,
              REG.MOVTO_E_S,
              REG.NORM_DEV,
              REG.GRUPO_CONTAGEM,
              REG.COD_DOCTO,
              REG.DATA_MOVTO,
              REG.NUM_DOCTO,
              REG.SERIE_DOCFIS,
              REG.SUB_SERIE_DOCFIS,
              REG.IND_PRODUTO,
              REG.COD_PRODUTO,
              REG.COD_UND_PADRAO,
              REG.COD_ALMOX,
              REG.COD_CUSTO,
              REG.NUM_ITEM,
              REG.COD_NAT_ESTOQUE,
              REG.CONTRATO,
              REG.SERIE_ITEM,
              REG.QTD_MOVTO,
              REG.PRECO_UNIT,
              REG.PRECO_ITEM,
              REG.CUSTO_UNIT,
              REG.CUSTO_ITEM,
              REG.COD_CONTA_CRED,
              REG.COD_CONTA_DEBITO,
              REG.COD_OPERACAO,
              REG.COD_CFO,
              REG.COD_ENT_SAIDA,
              REG.VLR_IPI,
              REG.OBS_ESTOQUE,
              REG.DATA_ESCRITA_FIS,
              REG.COD_MEDIDA,
              REG.COD_NBM,
              REG.IND_INSUMO,
              REG.COD_LEGENDA,
              REG.NUM_ORDEM,
              REG.NUM_DOCFIS_OFIC,
              REG.SERIE_DOCFIS_OFIC,
              REG.S_SERIE_DOCFIS_OFIC,
              REG.DAT_GRAVACAO,
              REG.IND_FIS_JUR,
              REG.COD_FIS_JUR,
              REG.IND_TP_MOVTO,
              REG.INSC_ESTADUAL,
              REG.IND_PRODUTO_RASTRO,
              REG.COD_PRODUTO_RASTRO,
              REG.VLR_ICMS,
              REG.DATA_DISP,
              REG.IND_DOC_OPER,
              REG.IND_TP_DOC_INTERNO,
              REG.IND_ATO_COTEPE,
              REG.IND_REDESIGNACAO,
              REG.IND_PRODUTO_ORI,
              REG.COD_PRODUTO_ORI,
              REG.VLR_CUSTO_DCA,
              REG.VLR_OUT_TRIB_NCUMUL,
              REG.COD_TP_LANCTO,
              REG.VLR_ICMS_DCA,
              REG.COD_DIF_PRODUCAO,
              REG.DSC_FINALIDADE,
              REG.COD_TIPO_MOV_EST,
              REG.COD_MEDIDA_ORI,
              REG.COD_NIVEL_PRODUTO,
              REG.QTD_INSUMO,
              P_PROCESSO,--REG.PST_ID,
              REG.NUM_LOTE,
              REG.IND_CF)
       
       RETURNING ROWID INTO v_rowid_retorno;
       
       RETURN v_rowid_retorno;

  end INSERT_LINE_SAFX10;


  FUNCTION INSERT_LINE_SAFX112(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID IS

    /* VETOR DA SAFX */
    REG SAFX112%ROWTYPE;
    
    v_rowid_retorno ROWID;

  BEGIN

    Linha_w := pstrLinha;
    PROC_LINHA(LINHA_W, REG.COD_EMPRESA);
    PROC_LINHA(LINHA_W, REG.COD_ESTAB);
    PROC_LINHA(LINHA_W, REG.DATA_FISCAL, 'S');
    PROC_LINHA(LINHA_W, REG.MOVTO_E_S, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.NORM_DEV, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_DOCTO);
    PROC_LINHA(LINHA_W, REG.IND_FIS_JUR, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_FIS_JUR);
    PROC_LINHA(LINHA_W, REG.NUM_DOCFIS);
    PROC_LINHA(LINHA_W, REG.SERIE_DOCFIS);
    PROC_LINHA(LINHA_W, REG.SUB_SERIE_DOCFIS);
    PROC_LINHA(LINHA_W, REG.COD_OBS_LANCTO_FISCAL, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.IND_ICOMPL_LANCTO);
    PROC_LINHA(LINHA_W, REG.DSC_COMPLEMENTAR);
    PROC_LINHA(LINHA_W, REG.VINCULACAO); -- OS3169-DW1

    INSERT INTO SAFX112
      (COD_EMPRESA,
       COD_ESTAB,
       DATA_FISCAL,
       MOVTO_E_S,
       NORM_DEV,
       COD_DOCTO,
       IND_FIS_JUR,
       COD_FIS_JUR,
       NUM_DOCFIS,
       SERIE_DOCFIS,
       SUB_SERIE_DOCFIS,
       COD_OBS_LANCTO_FISCAL,
       IND_ICOMPL_LANCTO,
       DSC_COMPLEMENTAR,
       VINCULACAO, -- OS3169-DW1
       DAT_GRAVACAO,
       PST_ID)
    VALUES
      (REG.COD_EMPRESA,
       REG.COD_ESTAB,
       REG.DATA_FISCAL,
       REG.MOVTO_E_S,
       REG.NORM_DEV,
       REG.COD_DOCTO,
       REG.IND_FIS_JUR,
       REG.COD_FIS_JUR,
       REG.NUM_DOCFIS,
       NVL(REG.SERIE_DOCFIS,'@'),
       NVL(REG.SUB_SERIE_DOCFIS,'@'),
       REG.COD_OBS_LANCTO_FISCAL,
       REG.IND_ICOMPL_LANCTO,
       REG.DSC_COMPLEMENTAR,
       REG.VINCULACAO, -- OS3169-DW1
       SYSDATE,
       P_PROCESSO)
       
       RETURNING ROWID INTO v_rowid_retorno;
       
       RETURN v_rowid_retorno;

  end INSERT_LINE_SAFX112;

  FUNCTION INSERT_LINE_SAFX113(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID IS

    /* VETOR DA SAFX */
    REG SAFX113%ROWTYPE;
    
    v_rowid_retorno ROWID;

  BEGIN

    Linha_w := pstrLinha;
    PROC_LINHA(LINHA_W, REG.COD_EMPRESA);
    PROC_LINHA(LINHA_W, REG.COD_ESTAB);
    PROC_LINHA(LINHA_W, REG.DATA_FISCAL, 'S');
    PROC_LINHA(LINHA_W, REG.MOVTO_E_S, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.NORM_DEV, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_DOCTO);
    PROC_LINHA(LINHA_W, REG.IND_FIS_JUR, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_FIS_JUR);
    PROC_LINHA(LINHA_W, REG.NUM_DOCFIS);
    PROC_LINHA(LINHA_W, REG.SERIE_DOCFIS);
    PROC_LINHA(LINHA_W, REG.SUB_SERIE_DOCFIS);
    PROC_LINHA(LINHA_W, REG.COD_OBS_LANCTO_FISCAL, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_AJUSTE_SPED);
    PROC_LINHA(LINHA_W, REG.DSC_COMP_AJUSTE);
    PROC_LINHA(LINHA_W, REG.NUM_ITEM);
    PROC_LINHA(LINHA_W, REG.VLR_BASE_ICMS);
    PROC_LINHA(LINHA_W, REG.ALIQUOTA_ICMS);
    PROC_LINHA(LINHA_W, REG.VLR_ICMS);
    PROC_LINHA(LINHA_W, REG.VLR_OUTROS);

    INSERT INTO SAFX113
      (cod_empresa,
       cod_estab,
       data_fiscal,
       movto_e_s,
       norm_dev,
       cod_docto,
       ind_fis_jur,
       cod_fis_jur,
       num_docfis,
       serie_docfis,
       sub_serie_docfis,
       cod_obs_lancto_fiscal,
       cod_ajuste_sped,
       dsc_comp_ajuste,
       num_item,
       vlr_base_icms,
       aliquota_icms,
       vlr_icms,
       vlr_outros,
       dat_gravacao,
       pst_id)
    VALUES
      (REG.COD_EMPRESA,
       REG.COD_ESTAB,
       REG.DATA_FISCAL,
       REG.MOVTO_E_S,
       REG.NORM_DEV,
       REG.COD_DOCTO,
       REG.IND_FIS_JUR,
       REG.COD_FIS_JUR,
       REG.NUM_DOCFIS,
       NVL(REG.SERIE_DOCFIS,'@'),
       NVL(REG.SUB_SERIE_DOCFIS,'@'),
       REG.COD_OBS_LANCTO_FISCAL,
       REG.COD_AJUSTE_SPED,
       REG.DSC_COMP_AJUSTE,
       REG.NUM_ITEM,
       REG.VLR_BASE_ICMS,
       REG.ALIQUOTA_ICMS,
       REG.VLR_ICMS,
       REG.VLR_OUTROS,
       SYSDATE,
       P_PROCESSO)
       
       RETURNING ROWID INTO v_rowid_retorno;
       
       RETURN v_rowid_retorno;

  end INSERT_LINE_SAFX113;

  FUNCTION INSERT_LINE_SAFX116(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID IS

    /* VETOR DA SAFX */
    REG SAFX116%ROWTYPE;
    
    v_rowid_retorno ROWID;

  BEGIN

    Linha_w := pstrLinha;

    PROC_LINHA(LINHA_W, REG.COD_EMPRESA);
    PROC_LINHA(LINHA_W, REG.COD_ESTAB);
    PROC_LINHA(LINHA_W, REG.DATA_FISCAL, 'S');
    PROC_LINHA(LINHA_W, REG.MOVTO_E_S, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.NORM_DEV, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_DOCTO);
    PROC_LINHA(LINHA_W, REG.IND_FIS_JUR, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_FIS_JUR);
    PROC_LINHA(LINHA_W, REG.NUM_DOCFIS);
    PROC_LINHA(LINHA_W, REG.SERIE_DOCFIS);
    PROC_LINHA(LINHA_W, REG.SUB_SERIE_DOCFIS);
    PROC_LINHA(LINHA_W, REG.COD_OBS_LANCTO_FISCAL, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.NUM_DOCFIS_REF);
    PROC_LINHA(LINHA_W, REG.SERIE_DOCFIS_REF);
    PROC_LINHA(LINHA_W, REG.SUB_SERIE_DOCFIS_REF);
    PROC_LINHA(LINHA_W, REG.MOVTO_E_S_REF);
    PROC_LINHA(LINHA_W, REG.IND_FIS_JUR_REF, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_FIS_JUR_REF);
    PROC_LINHA(LINHA_W, REG.DATA_FISCAL_REF);
    PROC_LINHA(LINHA_W, REG.COD_MODELO_REF);
    PROC_LINHA(LINHA_W, REG.NUM_AUTENTIC_NFE);

    INSERT INTO SAFX116
      (cod_empresa,
       cod_estab,
       data_fiscal,
       movto_e_s,
       norm_dev,
       cod_docto,
       ind_fis_jur,
       cod_fis_jur,
       num_docfis,
       serie_docfis,
       sub_serie_docfis,
       cod_obs_lancto_fiscal,
       data_fiscal_ref,
       movto_e_s_ref,
       cod_modelo_ref,
       ind_fis_jur_ref,
       cod_fis_jur_ref,
       num_docfis_ref,
       serie_docfis_ref,
       sub_serie_docfis_ref,
       NUM_AUTENTIC_NFE,
       dat_gravacao,
       pst_id)
    VALUES
      (REG.COD_EMPRESA,
       REG.COD_ESTAB,
       REG.DATA_FISCAL,
       REG.MOVTO_E_S,
       REG.NORM_DEV,
       REG.COD_DOCTO,
       REG.IND_FIS_JUR,
       REG.COD_FIS_JUR,
       NVL(REG.SERIE_DOCFIS,'@'),
       NVL(REG.SUB_SERIE_DOCFIS,'@'),
       REG.SUB_SERIE_DOCFIS,
       REG.COD_OBS_LANCTO_FISCAL,
       REG.DATA_FISCAL_REF,
       REG.MOVTO_E_S_REF,
       REG.COD_MODELO_REF,
       REG.IND_FIS_JUR_REF,
       REG.COD_FIS_JUR_REF,
       REG.NUM_DOCFIS_REF,
       REG.SERIE_DOCFIS_REF,
       REG.SUB_SERIE_DOCFIS_REF,
       REG.NUM_AUTENTIC_NFE,
       SYSDATE,
       P_PROCESSO)
       
       RETURNING ROWID INTO v_rowid_retorno;
       
       RETURN v_rowid_retorno;

  end INSERT_LINE_SAFX116;

  FUNCTION INSERT_LINE_SAFX118(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID IS

    /* VETOR DA SAFX */
    REG SAFX118%ROWTYPE;
    
    v_rowid_retorno ROWID;

  BEGIN

    Linha_w := pstrLinha;
    PROC_LINHA(LINHA_W, REG.COD_EMPRESA);
    PROC_LINHA(LINHA_W, REG.COD_ESTAB);
    PROC_LINHA(LINHA_W, REG.DATA_FISCAL, 'S');
    PROC_LINHA(LINHA_W, REG.MOVTO_E_S, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.NORM_DEV, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_DOCTO);
    PROC_LINHA(LINHA_W, REG.IND_FIS_JUR, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.COD_FIS_JUR);
    PROC_LINHA(LINHA_W, REG.NUM_DOCFIS);
    PROC_LINHA(LINHA_W, REG.SERIE_DOCFIS);
    PROC_LINHA(LINHA_W, REG.SUB_SERIE_DOCFIS);
    PROC_LINHA(LINHA_W, REG.COD_OBS_LANCTO_FISCAL, 'N', 'N');
    PROC_LINHA(LINHA_W, REG.VIA_TRANSP);
    PROC_LINHA(LINHA_W, REG.UF_COLETA);
    PROC_LINHA(LINHA_W, REG.MUNIC_COLETA);
    PROC_LINHA(LINHA_W, REG.CNPJ_COLETA);
    PROC_LINHA(LINHA_W, REG.IE_COLETA);
    PROC_LINHA(LINHA_W, REG.UF_ENTREGA);
    PROC_LINHA(LINHA_W, REG.MUNIC_ENTREGA);
    PROC_LINHA(LINHA_W, REG.CNPJ_ENTREGA);
    PROC_LINHA(LINHA_W, REG.IE_ENTREGA);

    INSERT INTO SAFX118
      (cod_empresa,
       cod_estab,
       data_fiscal,
       movto_e_s,
       norm_dev,
       cod_docto,
       ind_fis_jur,
       cod_fis_jur,
       num_docfis,
       serie_docfis,
       sub_serie_docfis,
       cod_obs_lancto_fiscal,
       via_transp,
       uf_coleta,
       munic_coleta,
       cnpj_coleta,
       ie_coleta,
       uf_entrega,
       munic_entrega,
       cnpj_entrega,
       ie_entrega,
       dat_gravacao,
       pst_id)
    VALUES
      (REG.COD_EMPRESA,
       REG.COD_ESTAB,
       REG.DATA_FISCAL,
       REG.MOVTO_E_S,
       REG.NORM_DEV,
       REG.COD_DOCTO,
       REG.IND_FIS_JUR,
       REG.COD_FIS_JUR,
       REG.NUM_DOCFIS,
       NVL(REG.SERIE_DOCFIS,'@'),
       NVL(REG.SUB_SERIE_DOCFIS,'@'),
       REG.COD_OBS_LANCTO_FISCAL,
       REG.VIA_TRANSP,
       REG.UF_COLETA,
       REG.MUNIC_COLETA,
       REG.CNPJ_COLETA,
       REG.IE_COLETA,
       REG.UF_ENTREGA,
       REG.MUNIC_ENTREGA,
       REG.CNPJ_ENTREGA,
       REG.IE_ENTREGA,
       SYSDATE,
       P_PROCESSO)
       
       RETURNING ROWID INTO v_rowid_retorno;
       
       RETURN v_rowid_retorno;

  end INSERT_LINE_SAFX118;

FUNCTION INSERT_LINE_SAFX2013(pstrLinha LONG, P_PROCESSO NUMBER) RETURN ROWID IS

    /* VETOR DA SAFX */
    REG SAFX2013%ROWTYPE;
    
    v_rowid_retorno ROWID;

  BEGIN

    Linha_w := pstrLinha;

      /*CAMPOS DA TABELA SAFX*/
      PROC_LINHA(LINHA_W, REG.IND_PRODUTO, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.COD_PRODUTO);
      PROC_LINHA(LINHA_W, REG.DATA_PRODUTO, 'S');
      PROC_LINHA(LINHA_W, REG.DESCRICAO);
      PROC_LINHA(LINHA_W, REG.COD_NBM);
      PROC_LINHA(LINHA_W, REG.COD_NCM);
      PROC_LINHA(LINHA_W, REG.COD_NALADI);
      PROC_LINHA(LINHA_W, REG.IND_REGIDO_SUBST, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.IND_CONTROLE_SELO, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.GRUPO_SELO);
      PROC_LINHA(LINHA_W, REG.SUB_GRUPO_SELO);
      PROC_LINHA(LINHA_W, REG.COR_SELO);
      PROC_LINHA(LINHA_W, REG.SERIE_SELO);
      PROC_LINHA(LINHA_W, REG.COD_MEDIDA);
      PROC_LINHA(LINHA_W, REG.COD_GRUPO_PROD);
      PROC_LINHA(LINHA_W, REG.COD_GRP_INCENT);
      PROC_LINHA(LINHA_W, REG.COD_GRUPO_ST);
      PROC_LINHA(LINHA_W, REG.COD_CONTA);
      PROC_LINHA(LINHA_W, REG.IND_INCID_ICMS_SER, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.COD_UND_PADRAO);
      PROC_LINHA(LINHA_W, REG.VLR_PESO_UNIT_KG);
      PROC_LINHA(LINHA_W, REG.DESCR_DETALHADA);
      PROC_LINHA(LINHA_W, REG.IND_FABRIC_ESTAB, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.FATOR_CONVERSAO);
      PROC_LINHA(LINHA_W, REG.IND_CLASSIF_ICMSS, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.DSC_MODELO);
      PROC_LINHA(LINHA_W, REG.ORIGEM, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.COD_GRP_PROD);
      PROC_LINHA(LINHA_W, REG.IND_INCID_PIS, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.ALIQ_PIS);
      PROC_LINHA(LINHA_W, REG.IND_INCID_COFINS, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.ALIQ_COFINS);
      PROC_LINHA(LINHA_W, REG.IND_FUNRURAL, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.IND_PETR_ENERG, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.IND_PRD_INCENTIV, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.IND_ICMS_DIFERIDO, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.CAPAC_VOLUM);
      PROC_LINHA(LINHA_W, REG.ESPECIE_DNF, 'N', 'N');

      PROC_LINHA(LINHA_W, REG.CLAS_ITEM, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.COD_BARRAS);
      PROC_LINHA(LINHA_W, REG.COD_ANP, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.IND_ANT_PROD, 'N', 'N');
      PROC_LINHA(LINHA_W, REG.COD_ANT_ITEM);
      /*RESTANTE DA LINHA DO ARQUIVO TEXTO - ULTIMO CAMPO*/
      PROC_LINHA(LINHA_W, REG.DAT_ALT_CODIGO, 'S');
      PROC_LINHA(LINHA_W, REG.CLAS_ENQUAD_IPI);
      PROC_LINHA(LINHA_W, REG.MATERIAL_RESULT_PERDA);
      PROC_LINHA(LINHA_W, REG.DSC_FINALIDADE);
      PROC_LINHA(LINHA_W, REG.QTD_CAP_MAX_ARMAZ);
      PROC_LINHA(LINHA_W, REG.IND_ATIVO_SAICS);
      PROC_LINHA(LINHA_W, REG.IND_TAB_INCIDENCIA); -- OS3169-DW1
      PROC_LINHA(LINHA_W, REG.COD_GRUPO); -- OS3169-DW1
      PROC_LINHA(LINHA_W, REG.MARCA_COMERCIAL); -- OS3169-DW1
      PROC_LINHA(LINHA_W, REG.IND_CARAC_PRODUTO);
      PROC_LINHA(LINHA_W, REG.COD_CEST);
      PROC_LINHA(LINHA_W, REG.VLR_RESERVADO1);
      PROC_LINHA(LINHA_W, REG.VLR_RESERVADO2);
      PROC_LINHA(LINHA_W, REG.VLR_RESERVADO3);
      PROC_LINHA(LINHA_W, REG.DSC_RESERVADO4);
      PROC_LINHA(LINHA_W, REG.DSC_RESERVADO5);
      PROC_LINHA(LINHA_W, REG.DSC_RESERVADO6);
      PROC_LINHA(LINHA_W, REG.DSC_RESERVADO7);
      PROC_LINHA(LINHA_W, REG.DSC_RESERVADO8);
      PROC_LINHA(LINHA_W, REG.IND_INC_RICMS_PR);

            INSERT INTO SAFX2013
              (IND_PRODUTO,
               COD_PRODUTO,
               DATA_PRODUTO,
               DESCRICAO,
               COD_NBM,
               COD_NCM,
               COD_NALADI,
               IND_REGIDO_SUBST,
               IND_CONTROLE_SELO,
               GRUPO_SELO,
               SUB_GRUPO_SELO,
               COR_SELO,
               SERIE_SELO,
               COD_MEDIDA,
               COD_GRUPO_PROD,
               COD_GRP_INCENT,
               COD_GRUPO_ST,
               COD_CONTA,
               IND_INCID_ICMS_SER,
               COD_UND_PADRAO,
               VLR_PESO_UNIT_KG,
               DESCR_DETALHADA,
               IND_FABRIC_ESTAB,
               FATOR_CONVERSAO,
               IND_CLASSIF_ICMSS,
               DAT_GRAVACAO,
               DSC_MODELO,
               ORIGEM,
               COD_GRP_PROD,
               IND_INCID_PIS,
               ALIQ_PIS,
               IND_INCID_COFINS,
               ALIQ_COFINS,
               IND_FUNRURAL,
               IND_PETR_ENERG,
               IND_PRD_INCENTIV,
               IND_ICMS_DIFERIDO,
               CAPAC_VOLUM,
               ESPECIE_DNF,
               CLAS_ITEM,
               COD_BARRAS,
               COD_ANP,
               IND_ANT_PROD,
               COD_ANT_ITEM,
               DAT_ALT_CODIGO,
               CLAS_ENQUAD_IPI,
               MATERIAL_RESULT_PERDA,
               DSC_FINALIDADE,
               QTD_CAP_MAX_ARMAZ,
               IND_ATIVO_SAICS,
               IND_TAB_INCIDENCIA,
               COD_GRUPO,
               MARCA_COMERCIAL,
               IND_CARAC_PRODUTO,
               COD_CEST,
               VLR_RESERVADO1,
               VLR_RESERVADO2,
               VLR_RESERVADO3,
               DSC_RESERVADO4,
               DSC_RESERVADO5,
               DSC_RESERVADO6,
               DSC_RESERVADO7,
               DSC_RESERVADO8,
               IND_INC_RICMS_PR,
               PST_ID)
            VALUES
              (REG.IND_PRODUTO,
               REG.COD_PRODUTO,
               REG.DATA_PRODUTO,
               REG.DESCRICAO,
               REG.COD_NBM,
               REG.COD_NCM,
               REG.COD_NALADI,
               REG.IND_REGIDO_SUBST,
               REG.IND_CONTROLE_SELO,
               REG.GRUPO_SELO,
               REG.SUB_GRUPO_SELO,
               REG.COR_SELO,
               REG.SERIE_SELO,
               REG.COD_MEDIDA,
               REG.COD_GRUPO_PROD,
               REG.COD_GRP_INCENT,
               REG.COD_GRUPO_ST,
               REG.COD_CONTA,
               REG.IND_INCID_ICMS_SER,
               REG.COD_UND_PADRAO,
               REG.VLR_PESO_UNIT_KG,
               REG.DESCR_DETALHADA,
               REG.IND_FABRIC_ESTAB,
               REG.FATOR_CONVERSAO,
               REG.IND_CLASSIF_ICMSS,
               SYSDATE,
               REG.DSC_MODELO,
               REG.ORIGEM,
               REG.COD_GRP_PROD,
               REG.IND_INCID_PIS,
               REG.ALIQ_PIS,
               REG.IND_INCID_COFINS,
               REG.ALIQ_COFINS,
               REG.IND_FUNRURAL,
               REG.IND_PETR_ENERG,
               REG.IND_PRD_INCENTIV,
               REG.IND_ICMS_DIFERIDO,
               REG.CAPAC_VOLUM,
               REG.ESPECIE_DNF,
               REG.CLAS_ITEM,
               REG.COD_BARRAS,
               REG.COD_ANP,
               REG.IND_ANT_PROD,
               REG.COD_ANT_ITEM,
               REG.DAT_ALT_CODIGO,
               REG.CLAS_ENQUAD_IPI,
               REG.MATERIAL_RESULT_PERDA,
               REG.DSC_FINALIDADE,
               REG.QTD_CAP_MAX_ARMAZ,
               REG.IND_ATIVO_SAICS,
               REG.IND_TAB_INCIDENCIA,
               REG.COD_GRUPO,
               REG.MARCA_COMERCIAL,
               REG.IND_CARAC_PRODUTO,
               REG.COD_CEST,
               REG.VLR_RESERVADO1,
               REG.VLR_RESERVADO2,
               REG.VLR_RESERVADO3,
               REG.DSC_RESERVADO4,
               REG.DSC_RESERVADO5,
               REG.DSC_RESERVADO6,
               REG.DSC_RESERVADO7,
               REG.DSC_RESERVADO8,
               REG.IND_INC_RICMS_PR,
               P_PROCESSO)
       
       RETURNING ROWID INTO v_rowid_retorno;
       
       RETURN v_rowid_retorno;

  end INSERT_LINE_SAFX2013;

END MSAF_EXPORTA_NOTA_CPROC;
/

OWNER      NAME                      TEXT
---------- ------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------
TPASAPSEC  FFM_AA_POSCON_01_SP       PROCEDURE           FFM_AA_PosCon_01_sp ( p_Ahora IN VARCHAR,p_AAA_KEY IN VARCHAR, r_FOT_ID OUT NUMBER, p_FFO IN INTEGER)
TPASAPSEC  FFM_AA_POSCON_01_SP       AS
TPASAPSEC  FFM_AA_POSCON_01_SP               v_AhoraDate TIMESTAMP;
TPASAPSEC  FFM_AA_POSCON_01_SP               v_FOT_ID NUMBER;
TPASAPSEC  FFM_AA_POSCON_01_SP               v_cuantasOTS NUMBER;
TPASAPSEC  FFM_AA_POSCON_01_SP               v_FFO_ID_OPERATOR INTEGER;
TPASAPSEC  FFM_AA_POSCON_01_SP               v_CantidadDeOperadores INTEGER;
TPASAPSEC  FFM_AA_POSCON_01_SP               v_now TIMESTAMP;
TPASAPSEC  FFM_AA_POSCON_01_SP               v_Hoy   VARCHAR(16);
TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP               v_DISPATCHER_ID INTEGER;
TPASAPSEC  FFM_AA_POSCON_01_SP               v_FFR INTEGER;
TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP               v_TierOT VARCHAR(128);
TPASAPSEC  FFM_AA_POSCON_01_SP               v_TierCUAD VARCHAR(128);
TPASAPSEC  FFM_AA_POSCON_01_SP               C_TierOT INTEGER;
TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP                v_DepurarTablas INTEGER;
TPASAPSEC  FFM_AA_POSCON_01_SP                count_DepurarTablas INTEGER;
TPASAPSEC  FFM_AA_POSCON_01_SP                countEstadisticas NUMBER;
TPASAPSEC  FFM_AA_POSCON_01_SP       BEGIN
TPASAPSEC  FFM_AA_POSCON_01_SP       ------------------------------------------------------------------------------------------------------------------------------------------------------
                                     --------------------------

TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP               SELECT CURRENT_TIMESTAMP INTO v_now FROM DUAL;
TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP               v_AhoraDate := TO_TIMESTAMP(p_Ahora, 'DD/MM/YYYY HH24:MI:SS:FF' );
TPASAPSEC  FFM_AA_POSCON_01_SP               -- Obtener el FFO_ID_OPERATOR para las Alertas
TPASAPSEC  FFM_AA_POSCON_01_SP               SELECT COUNT(1) INTO v_CantidadDeOperadores FROM TPASAPSEC.FFM_AA_PARAMETROS WHERE FAP_ID = 4 AND FAP_STATUS = 1;
TPASAPSEC  FFM_AA_POSCON_01_SP               IF v_CantidadDeOperadores = 1 THEN
TPASAPSEC  FFM_AA_POSCON_01_SP                       SELECT TO_NUMBER(FAP_VALOR) INTO v_FFO_ID_OPERATOR FROM TPASAPSEC.FFM_AA_PARAMETROS WHERE FAP_ID = 4 AND FAP_STATUS = 1;
TPASAPSEC  FFM_AA_POSCON_01_SP               ELSE
TPASAPSEC  FFM_AA_POSCON_01_SP                       v_FFO_ID_OPERATOR := 0;
TPASAPSEC  FFM_AA_POSCON_01_SP               END IF;
TPASAPSEC  FFM_AA_POSCON_01_SP               -- PREPARAR EL PARAMETRO DE SALIDA
TPASAPSEC  FFM_AA_POSCON_01_SP                SELECT SUM(ATENDIDO) INTO v_cuantasOTS FROM TPASAPSEC.FFM_AA_RESULTADOS_01
TPASAPSEC  FFM_AA_POSCON_01_SP                WHERE FFO_ID = p_FFO  AND  ATENDIDO = 1 AND  AAA_ID = p_AAA_KEY GROUP BY FOT_ID;
TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP                IF v_cuantasOTS >= 1 THEN
TPASAPSEC  FFM_AA_POSCON_01_SP                            SELECT FOT_ID INTO r_FOT_ID
TPASAPSEC  FFM_AA_POSCON_01_SP                            FROM TPASAPSEC.FFM_AA_RESULTADOS_01 WHERE ATENDIDO = 1 AND FFO_ID = p_FFO AND AAA_ID = p_AAA_KEY;
TPASAPSEC  FFM_AA_POSCON_01_SP                ELSE
TPASAPSEC  FFM_AA_POSCON_01_SP                           v_FOT_ID := 0;
TPASAPSEC  FFM_AA_POSCON_01_SP                END IF;
TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP                -- Sacar el tier de la OT
TPASAPSEC  FFM_AA_POSCON_01_SP                SELECT  COUNT(1) INTO C_TierOT
TPASAPSEC  FFM_AA_POSCON_01_SP                       FROM TPASAPSEC.FFM_ORDER_TRANSACTIONS FOT
TPASAPSEC  FFM_AA_POSCON_01_SP                       LEFT JOIN   TPASAPSEC.FFM_CAT_TREE TIER_1 ON TIER_1.FCT_ID_PARENT = FOT.FCT_ID
TPASAPSEC  FFM_AA_POSCON_01_SP                       WHERE FOT.FOT_ID = r_FOT_ID;
TPASAPSEC  FFM_AA_POSCON_01_SP                IF C_TierOT > 0 THEN
TPASAPSEC  FFM_AA_POSCON_01_SP                        SELECT   TIER_1.FCT_TIER || '-' || TIER_1.FCT_DESCRIPTION INTO v_TierOT
TPASAPSEC  FFM_AA_POSCON_01_SP                               FROM TPASAPSEC.FFM_ORDER_TRANSACTIONS FOT
TPASAPSEC  FFM_AA_POSCON_01_SP                               LEFT JOIN   TPASAPSEC.FFM_CAT_TREE TIER_1 ON TIER_1.FCT_ID_PARENT = FOT.FCT_ID
TPASAPSEC  FFM_AA_POSCON_01_SP                               WHERE FOT.FOT_ID = r_FOT_ID;
TPASAPSEC  FFM_AA_POSCON_01_SP                ELSE
TPASAPSEC  FFM_AA_POSCON_01_SP                       v_TierOT:= ' NO SE LOCALIZO LA TIER DE LA OT';
TPASAPSEC  FFM_AA_POSCON_01_SP               END IF;
TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP                -- Sacar el tier de la Cuadrilla
TPASAPSEC  FFM_AA_POSCON_01_SP                SELECT  TIER_1.FCT_DESCRIPTION || '-' || TIER_1.FCT_TIER INTO v_TierCUAD
TPASAPSEC  FFM_AA_POSCON_01_SP                   FROM TPASAPSEC.FFM_FIELD_OPERATIONS FFO
TPASAPSEC  FFM_AA_POSCON_01_SP                   LEFT JOIN   TPASAPSEC.FFM_CAT_TREE TIER_1 ON TIER_1.FCT_ID_PARENT = FFO.FCT_ID
TPASAPSEC  FFM_AA_POSCON_01_SP                   WHERE FFO.FFO_ID = p_FFO;
TPASAPSEC  FFM_AA_POSCON_01_SP                ---------------------------------------------------------------------------------------------------------------------------------------------
                                     -----------------------------------

TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP                INSERT INTO TPASAPSEC.FFM_AA_LogEvents  (FAL_TIMESTAMP, FAL_AAA_ID,FAL_TIER_OT_FCT_DESCRIPTION,FAL_TIER_CUAD_FCT_DESCRIPTION, FAL_AAA_NUMBER,
                                      FAL_DESCRIPTION)

TPASAPSEC  FFM_AA_POSCON_01_SP                             VALUES (v_Now,p_AAA_KEY,v_TierOT,v_TierCUAD,1,'Resultado: Cuadrilla: ' || p_FFO  || ' se le asignara la OT: ' ||    r_FOT_ID);
TPASAPSEC  FFM_AA_POSCON_01_SP                COMMIT;
TPASAPSEC  FFM_AA_POSCON_01_SP                ---------------------------------------------------------------------------------------------------------------------------------------------
                                     -----------------------------------

TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP               -- Revisar el parametro a ver si debemos depurar las tablas
TPASAPSEC  FFM_AA_POSCON_01_SP               SELECT COUNT(1) INTO count_DepurarTablas FROM TPASAPSEC.FFM_AA_PARAMETROS WHERE  FAP_VALOR = 'BORRAR TABLAS DESPUES DE ASIGNAR';
TPASAPSEC  FFM_AA_POSCON_01_SP               IF count_DepurarTablas >= 1 THEN
TPASAPSEC  FFM_AA_POSCON_01_SP                           SELECT MAX( FAP_STATUS) INTO count_DepurarTablas FROM TPASAPSEC.FFM_AA_PARAMETROS WHERE  FAP_VALOR = 'BORRAR TABLAS DESPUES DE ASI
                                     GNAR';

TPASAPSEC  FFM_AA_POSCON_01_SP                           IF count_DepurarTablas = 1 THEN
TPASAPSEC  FFM_AA_POSCON_01_SP                               DELETE FROM TPASAPSEC.FFM_AA_CUADRILLAS_A_01 WHERE AAA_ID = p_AAA_KEY;
TPASAPSEC  FFM_AA_POSCON_01_SP                               DELETE FROM TPASAPSEC.FFM_AA_OTS_A_CONSIDERAR_01 WHERE AAA_ID = p_AAA_KEY;
TPASAPSEC  FFM_AA_POSCON_01_SP                               DELETE FROM TPASAPSEC.FFM_AA_FACTOR_A_CONSIDERAR_01 WHERE AAA_ID = p_AAA_KEY;
TPASAPSEC  FFM_AA_POSCON_01_SP                               DELETE FROM TPASAPSEC.FFM_AA_RESULTADOS_01 WHERE AAA_ID = p_AAA_KEY;
TPASAPSEC  FFM_AA_POSCON_01_SP                               COMMIT;
TPASAPSEC  FFM_AA_POSCON_01_SP                           END IF;
TPASAPSEC  FFM_AA_POSCON_01_SP               ELSE
TPASAPSEC  FFM_AA_POSCON_01_SP                       v_DepurarTablas := 0;
TPASAPSEC  FFM_AA_POSCON_01_SP               END IF;
TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP       /*
TPASAPSEC  FFM_AA_POSCON_01_SP                ---------------------------------------------------------------------------------------------------------------------------------------------
                                     -----------------------------------

TPASAPSEC  FFM_AA_POSCON_01_SP                 -- CASO III Y IV, SI NO SE PUDO REAGENDAR ENTONCES REPORTAR EN QUERTY_ALERT
TPASAPSEC  FFM_AA_POSCON_01_SP                INSERT INTO TPASAPSEC.FFM_QUERY_ALERT       (FFO_ID_OPERATOR, FOT_ID_ORDER , FCS_ID_STATUS, FQA_DESCRIPTION , FQA_DATE , FQA_ID , FQA_ACTIVE)


TPASAPSEC  FFM_AA_POSCON_01_SP                         SELECT v_FFO_ID_OPERATOR,FOT_ID ,6 ,'NO SE PUDO PRE-REAGENDAR TIPO III/IV' ,v_AhoraDate ,'' , 1
TPASAPSEC  FFM_AA_POSCON_01_SP                        FROM
TPASAPSEC  FFM_AA_POSCON_01_SP                                ( SELECT FOT_ID, SUM(ATENDIDO) TOTAL
TPASAPSEC  FFM_AA_POSCON_01_SP                                  FROM TPASAPSEC.FFM_AA_RESULTADOS_01
TPASAPSEC  FFM_AA_POSCON_01_SP                                  --WHERE AAA_ID = p_AAA_KEY
TPASAPSEC  FFM_AA_POSCON_01_SP                                  GROUP BY FOT_ID
TPASAPSEC  FFM_AA_POSCON_01_SP                                )
TPASAPSEC  FFM_AA_POSCON_01_SP                        WHERE TOTAL = 0;
TPASAPSEC  FFM_AA_POSCON_01_SP                COMMIT;
TPASAPSEC  FFM_AA_POSCON_01_SP       */
TPASAPSEC  FFM_AA_POSCON_01_SP                -- Depuracion, deshabilitada
TPASAPSEC  FFM_AA_POSCON_01_SP                -- DELETE FROM TPASAPSEC.FFM_AA_RESULTADOS_02 WHERE AAA_ID = p_AAA_KEY;
TPASAPSEC  FFM_AA_POSCON_01_SP                -- COMMIT;
TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP
TPASAPSEC  FFM_AA_POSCON_01_SP        END;

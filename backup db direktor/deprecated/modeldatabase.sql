CREATE TABLE Ana_Integrantes
(
	codProyecto          BIGINT  NOT NULL ,
	codAnaRes            BIGINT  NOT NULL ,
	codEstado            INT  NULL ,
	dayFechaCreacion     DATETIME  NULL ,
	desUsuarioCreacion   varchar(255)  NULL ,
	codProyIntegrante    BIGINT  NULL
)
;



ALTER TABLE Ana_Integrantes
	ADD CONSTRAINT XPKAna_Integrantes PRIMARY KEY  CLUSTERED (codProyecto ASC,codAnaRes ASC)
;



CREATE TABLE AnaRes_Actividad
(
	codAnaResActividad   BIGINT  NOT NULL ,
	desActividad         varchar(255)  NULL ,
	desRestriccion       varchar(255)  NULL ,
	codTipoRestriccion   INT  NULL ,
	dayFechaRequerida    DATETIME  NULL ,
	idUsuarioResponsable BIGINT  NULL ,
	desAreaResponsable   char(18)  NULL ,
	codEstadoActividad   char(18)  NULL ,
	codUsuarioSolicitante char(18)  NULL ,
	codAnaResFase        BIGINT  NOT NULL ,
	codAnaResFrente      BIGINT  NOT NULL ,
	codProyecto          BIGINT  NOT NULL ,
	codAnaRes            BIGINT  NOT NULL
)
;



ALTER TABLE AnaRes_Actividad
	ADD CONSTRAINT XPKAnaRes_Actividad PRIMARY KEY  CLUSTERED (codAnaResActividad ASC,codAnaResFase ASC,codAnaResFrente ASC,codProyecto ASC,codAnaRes ASC)
;



CREATE TABLE AnaRes_AnalisisRestricciones
(
	codProyecto          BIGINT  NOT NULL ,
	codEstado            INT  NULL ,
	dayFechaCreacion     DATETIME  NULL ,
	desUsuarioCreacion   varchar(255)  NULL ,
	indNoRetrasados      INT  NULL ,
	indRetrasados        INT  NULL ,
	codAnaRes            BIGINT  NOT NULL
)
;



ALTER TABLE AnaRes_AnalisisRestricciones
	ADD CONSTRAINT XPKAnaRes_AnalisisRestricciones PRIMARY KEY  CLUSTERED (codProyecto ASC,codAnaRes ASC)
;



CREATE TABLE AnaRes_Fase
(
	codAnaResFase        BIGINT  NOT NULL ,
	desAnaResFase        varchar(255)  NULL ,
	dayFechaCreacion     DATETIME  NULL ,
	desUsuarioCreacion   varchar(255)  NULL ,
	codAnaResFrente      BIGINT  NOT NULL ,
	codProyecto          BIGINT  NOT NULL ,
	codAnaRes            BIGINT  NOT NULL
)
;



ALTER TABLE AnaRes_Fase
	ADD CONSTRAINT XPKAnaRes_Fase PRIMARY KEY  CLUSTERED (codAnaResFase ASC,codAnaResFrente ASC,codProyecto ASC,codAnaRes ASC)
;



CREATE TABLE AnaRes_Frente
(
	codAnaResFrente      BIGINT  NOT NULL ,
	desAnaResFrente      varchar(255)  NULL ,
	dayFechaCreacion     DATETIME  NULL ,
	desUsuarioCreacion   varchar(255)  NULL ,
	codProyecto          BIGINT  NOT NULL ,
	codAnaRes            BIGINT  NOT NULL
)
;



ALTER TABLE AnaRes_Frente
	ADD CONSTRAINT XPKAnaRes_Frente PRIMARY KEY  CLUSTERED (codAnaResFrente ASC,codProyecto ASC,codAnaRes ASC)
;



CREATE TABLE Conf_Estado
(
	codEstado            INT  NOT NULL ,
	desEstado            varchar(255)  NULL ,
	desModule            varchar(255)  NULL
)
;



ALTER TABLE Conf_Estado
	ADD CONSTRAINT XPKConf_Estado PRIMARY KEY  CLUSTERED (codEstado ASC)
;



CREATE TABLE Conf_Ubigeo
(
	codUbigeo            INT  NOT NULL ,
	desUbigeo            varchar(255)  NULL ,
	Departamento         varchar(255)  NULL ,
	Provincia            varchar(255)  NULL ,
	Distrito             varchar(255)  NULL
)
;



ALTER TABLE Conf_Ubigeo
	ADD CONSTRAINT XPKConf_Ubigeo PRIMARY KEY  CLUSTERED (codUbigeo ASC)
;



CREATE TABLE other_Notificaciones
(
	codNotificacion      INT  NOT NULL ,
	desNombre            varchar(255)  NULL ,
	desDescripción       varchar(255)  NULL ,
	desPersonalizar      varchar(255)  NULL
)
;



ALTER TABLE other_Notificaciones
	ADD CONSTRAINT XPKother_Notificaciones PRIMARY KEY  CLUSTERED (codNotificacion ASC)
;



CREATE TABLE other_Notificaciones_Usuario
(
	id                   bigint(20) unsigned NOT NULL ,
	codNotificacion      INT  NOT NULL ,
	codEstado            INT  NULL ,
	dayFechaCreacion     DATETIME  NULL ,
	desUsuarioCreación   varchar(255)  NULL
)
;



ALTER TABLE other_Notificaciones_Usuario
	ADD CONSTRAINT XPKother_Notificaciones_Usuario PRIMARY KEY  CLUSTERED (id ASC,codNotificacion ASC)
;



CREATE TABLE Proy_Integrantes
(
	codProyecto          BIGINT  NOT NULL ,
	codEstadoInvitacion  INT  NULL ,
	desArea              varchar(255)  NULL ,
	dayFechaInvitacion   DATETIME  NULL ,
	dayFechaInvitacionConfirmacion DATETIME  NULL ,
	codRolIntegrante     INT  NULL ,
	codProyIntegrante    BIGINT  NOT NULL ,
	desCorreo            varchar(250)  NULL
)
;



ALTER TABLE Proy_Integrantes
	ADD CONSTRAINT XPKProy_Integrantes PRIMARY KEY  CLUSTERED (codProyecto ASC,codProyIntegrante ASC)
;



CREATE TABLE Proy_Proyecto
(
	codProyecto          BIGINT  NOT NULL ,
	desNombreProyecto    varchar(250)  NULL ,
	codEstado            INT  NULL ,
	id                   bigint(20)  unsigned NOT NULL ,
	desEmpresa           varchar(100)  NULL ,
	numPlazo             INT  NULL ,
	numAreaTechado       decimal(25,2)  NULL ,
	desTipoProyecto      varchar(255)  NULL ,
	codUbigeo            INT  NULL ,
	dayFechaInicio       DATETIME  NULL ,
	numMontoReferencial  decimal(25,2)  NULL ,
	numAreaTechada       decimal(25,2)  NULL ,
	numAreaConstruida    decimal(25,2)  NULL ,
	desDireccion         varchar(255)  NULL ,
	dayFechaCreacion     DATETIME  NULL ,
	desUsuarioCreacion   varchar(255)  NULL
)
;



ALTER TABLE Proy_Proyecto
	ADD CONSTRAINT XPKProy_Proyecto PRIMARY KEY  CLUSTERED (codProyecto ASC)
;



CREATE TABLE Proy_ProyectoReportes
(
	codUtilReportes      INT  NOT NULL ,
	codProyecto          BIGINT  NOT NULL ,
	flagReporteMasivo    INT  NULL ,
	codTipoFrecuencia    char(2)  NULL ,
	dayFechaCreacion     DATETIME  NULL ,
	desUsuarioCreacion   varchar(255)  NULL ,
	desCorreoEnvios      varchar(255)  NULL
)
;



ALTER TABLE Proy_ProyectoReportes
	ADD CONSTRAINT XPKProy_ProyectoReportes PRIMARY KEY  CLUSTERED (codUtilReportes ASC,codProyecto ASC)
;



CREATE TABLE Proy_RolIntegrante
(
	codRolIntegrante     INT  NOT NULL ,
	desRolIntegrante     varchar(255)  NULL
)
;



ALTER TABLE Proy_RolIntegrante
	ADD CONSTRAINT XPKProy_RolIntegrante PRIMARY KEY  CLUSTERED (codRolIntegrante ASC)
;



CREATE TABLE Sec_Cargo
(
	codCargo             INT  NOT NULL ,
	nameCargo            varchar(255)  NULL
)
;



ALTER TABLE Sec_Cargo
	ADD CONSTRAINT XPKSec_Cargo PRIMARY KEY  CLUSTERED (codCargo ASC)
;



CREATE TABLE Sec_Membresia
(
	codMembresia         BIGINT  NOT NULL ,
	desMembresia         varchar(255)  NULL ,
	canDiasPrueba        integer  NULL ,
	desMonto             varchar(255)  NULL ,
	canProyectos         integer  NULL ,
	desFrecuencia        varchar(255)  NULL
)
;



ALTER TABLE Sec_Membresia
	ADD CONSTRAINT XPKSec_Membresia PRIMARY KEY  CLUSTERED (codMembresia ASC)
;



CREATE TABLE Sec_MembresiaUsuario
(
	codMembresiaUsuario  BIGINT  NOT NULL ,
	codMembresia         BIGINT  NOT NULL ,
	dayFechaInicio       DATETIME  NULL ,
	dayFechaFin          DATETIME  NULL ,
	codEstado            INT  NULL ,
	des_PagoVerificado   varchar(100)  NULL ,
	id                   bigint(20)  unsigned NOT NULL
)
;



ALTER TABLE Sec_MembresiaUsuario
	ADD CONSTRAINT XPKSec_MembresiaUsuario PRIMARY KEY  CLUSTERED (codMembresiaUsuario ASC,codMembresia ASC,id ASC)
;



CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombreempresa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codCargo` int null,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE Util_Reportes
(
	codUtilReportes      INT  NOT NULL ,
	desUtilReportes      varchar(255)  NULL ,
	desDirReporte        varchar(255)  NULL
)
;



ALTER TABLE Util_Reportes
	ADD CONSTRAINT XPKUtil_Reportes PRIMARY KEY  CLUSTERED (codUtilReportes ASC)
;




ALTER TABLE Ana_Integrantes
	ADD CONSTRAINT R_16 FOREIGN KEY (codProyecto,codAnaRes) REFERENCES AnaRes_AnalisisRestricciones(codProyecto,codAnaRes)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE Ana_Integrantes
	ADD CONSTRAINT R_20 FOREIGN KEY (codProyecto,codProyIntegrante) REFERENCES Proy_Integrantes(codProyecto,codProyIntegrante)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE AnaRes_Actividad
	ADD CONSTRAINT R_15 FOREIGN KEY (codAnaResFase,codAnaResFrente,codProyecto,codAnaRes) REFERENCES AnaRes_Fase(codAnaResFase,codAnaResFrente,codProyecto,codAnaRes)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE AnaRes_AnalisisRestricciones
	ADD CONSTRAINT R_12 FOREIGN KEY (codProyecto) REFERENCES Proy_Proyecto(codProyecto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE AnaRes_Fase
	ADD CONSTRAINT R_14 FOREIGN KEY (codAnaResFrente,codProyecto,codAnaRes) REFERENCES AnaRes_Frente(codAnaResFrente,codProyecto,codAnaRes)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE AnaRes_Frente
	ADD CONSTRAINT R_13 FOREIGN KEY (codProyecto,codAnaRes) REFERENCES AnaRes_AnalisisRestricciones(codProyecto,codAnaRes)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE other_Notificaciones_Usuario
	ADD CONSTRAINT R_17 FOREIGN KEY (id) REFERENCES users(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE other_Notificaciones_Usuario
	ADD CONSTRAINT R_18 FOREIGN KEY (codNotificacion) REFERENCES other_Notificaciones(codNotificacion)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE Proy_Integrantes
	ADD CONSTRAINT R_6 FOREIGN KEY (codProyecto) REFERENCES Proy_Proyecto(codProyecto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE Proy_Integrantes
	ADD CONSTRAINT R_9 FOREIGN KEY (codRolIntegrante) REFERENCES Proy_RolIntegrante(codRolIntegrante)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE Proy_Proyecto
	ADD CONSTRAINT R_5 FOREIGN KEY (id) REFERENCES users(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE Proy_Proyecto
	ADD CONSTRAINT R_8 FOREIGN KEY (codUbigeo) REFERENCES Conf_Ubigeo(codUbigeo)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE Proy_ProyectoReportes
	ADD CONSTRAINT R_10 FOREIGN KEY (codUtilReportes) REFERENCES Util_Reportes(codUtilReportes)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE Proy_ProyectoReportes
	ADD CONSTRAINT R_11 FOREIGN KEY (codProyecto) REFERENCES Proy_Proyecto(codProyecto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE Sec_MembresiaUsuario
	ADD CONSTRAINT R_4 FOREIGN KEY (codMembresia) REFERENCES Sec_Membresia(codMembresia)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE Sec_MembresiaUsuario
	ADD CONSTRAINT R_21 FOREIGN KEY (id) REFERENCES users(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE users
	ADD CONSTRAINT R_19 FOREIGN KEY (codCargo) REFERENCES Sec_Cargo(codCargo)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;



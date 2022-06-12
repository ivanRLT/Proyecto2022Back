TRUNCATE TABLE 
	alojamientos,
	usuarios, 
	calificaciones,
	dt_direccion,
	dt_servicios,
	facturas,
	habitaciones,
	huesped_push_tokens,
   	password_reset_token,
	recuperaciones,
	reservas
CASCADE;
/* MYSQL >>>>*/
/*SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE 	alojamientos;
TRUNCATE TABLE 	usuarios; 
TRUNCATE TABLE 	calificaciones;
TRUNCATE TABLE 	dt_direccion;
TRUNCATE TABLE 	dt_servicios;
TRUNCATE TABLE 	facturas;
TRUNCATE TABLE 	habitaciones;
TRUNCATE TABLE 	huesped_push_tokens;
TRUNCATE TABLE    password_reset_token;
TRUNCATE TABLE 	recuperaciones;
TRUNCATE TABLE 	reservas;
*/

INSERT INTO usuarios 
(id, activo, bloqueado,	estado,   nombre, apellido, email, dtype, pass, user_id, calificacion_global)
VALUES
( 1001, TRUE,     FALSE,       NULL, 'nomAd 1001', 'apeAd 1001', 'emailAd 1001', 'Ad', 'adPass 1001', NULL,  1000 ), 
( 1002, TRUE,     FALSE,       NULL, 'nomAd 1002', 'apeAd 1002', 'emailAd 1002', 'Ad', 'adPass 1002', NULL,  1000 ), 
( 1003, TRUE,     FALSE,       NULL, 'nomAd 1003', 'apeAd 1003', 'emailAd 1003', 'Ad', 'adPass 1003', NULL,  1000 ), 
( 1004, TRUE,     FALSE,       NULL, 'nomAd 1004', 'apeAd 1004', 'emailAd 1004', 'Ad', 'adPass 1004', NULL,  1000 ), 
( 1005, FALSE,     FALSE,       NULL, 'nomAd 1005', 'apeAd 1005', 'emailAd 1005', 'Ad', 'adPass 1005', NULL,  1000 ), 
( 1006, TRUE,     FALSE,       NULL, 'nomAd 1006', 'apeAd 1006', 'emailAd 1006', 'Ad', 'adPass 1006', NULL,  1000 ), 
( 1007, TRUE,     TRUE,       NULL, 'nomAd 1007', 'apeAd 1007', 'emailAd 1007', 'Ad', 'adPass 1007', NULL,  1000 ), 
( 1008, TRUE,     FALSE,       NULL, 'nomAd 1008', 'apeAd 1008', 'emailAd 1008', 'Ad', 'adPass 1008', NULL,  1000 ), 
( 1009, TRUE,     FALSE,       NULL, 'nomAd 1009', 'apeAd 1009', 'emailAd 1009', 'Ad', 'adPass 1009', NULL,  1000 ), 
( 10010, TRUE,     FALSE,       NULL, 'nomAd 10010', 'apeAd 10010', 'emailAd 10010', 'Ad', 'adPass 10010', NULL,  1000 ), 
( 10011, TRUE,     FALSE,       NULL, 'nomAd 10011', 'apeAd 10011', 'emailAd 10011', 'Ad', 'adPass 10011', NULL,  1000 ), 
( 10012, TRUE,     FALSE,       NULL, 'nomAd 10012', 'apeAd 10012', 'emailAd 10012', 'Ad', 'adPass 10012', NULL,  1000 ), 
( 10013, FALSE,     FALSE,       NULL, 'nomAd 10013', 'apeAd 10013', 'emailAd 10013', 'Ad', 'adPass 10013', NULL,  1000 ), 
( 10014, TRUE,     FALSE,       NULL, 'nomAd 10014', 'apeAd 10014', 'emailAd 10014', 'Ad', 'adPass 10014', NULL,  1000 ), 
( 10015, TRUE,     FALSE,       NULL, 'nomAd 10015', 'apeAd 10015', 'emailAd 10015', 'Ad', 'adPass 10015', NULL,  1000 ), 
( 10016, TRUE,     FALSE,       NULL, 'nomAd 10016', 'apeAd 10016', 'emailAd 10016', 'Ad', 'adPass 10016', NULL,  1000 ), 
( 10017, TRUE,     FALSE,       NULL, 'nomAd 10017', 'apeAd 10017', 'emailAd 10017', 'Ad', 'adPass 10017', NULL,  1000 ), 
( 10018, TRUE,     FALSE,       NULL, 'nomAd 10018', 'apeAd 10018', 'emailAd 10018', 'Ad', 'adPass 10018', NULL,  1000 ), 
( 10019, TRUE,     FALSE,       NULL, 'nomAd 10019', 'apeAd 10019', 'emailAd 10019', 'Ad', 'adPass 10019', NULL,  1000 ), 
( 10020, TRUE,     FALSE,       NULL, 'nomAd 10020', 'apeAd 10020', 'emailAd 10020', 'Ad', 'adPass 10020', NULL,  1000 ), 
( 10021, TRUE,     FALSE,       'APROBADO', 'nomAn 10021', 'apeAn 10021', 'emailAn 10021', 'An', 'anPass 10021', NULL,  1000 ), 
( 10022, TRUE,     FALSE,       'APROBADO', 'nomAn 10022', 'apeAn 10022', 'emailAn 10022', 'An', 'anPass 10022', NULL,  1000 ), 
( 10023, FALSE,     FALSE,       'APROBADO', 'nomAn 10023', 'apeAn 10023', 'emailAn 10023', 'An', 'anPass 10023', NULL,  1000 ), 
( 10024, TRUE,     FALSE,       'APROBADO', 'nomAn 10024', 'apeAn 10024', 'emailAn 10024', 'An', 'anPass 10024', NULL,  1000 ), 
( 10025, TRUE,     FALSE,       'APROBADO', 'nomAn 10025', 'apeAn 10025', 'emailAn 10025', 'An', 'anPass 10025', NULL,  1000 ), 
( 10026, TRUE,     FALSE,       'APROBADO', 'nomAn 10026', 'apeAn 10026', 'emailAn 10026', 'An', 'anPass 10026', NULL,  1000 ), 
( 10027, TRUE,     FALSE,       'APROBADO', 'nomAn 10027', 'apeAn 10027', 'emailAn 10027', 'An', 'anPass 10027', NULL,  1000 ), 
( 10028, TRUE,     FALSE,       'APROBADO', 'nomAn 10028', 'apeAn 10028', 'emailAn 10028', 'An', 'anPass 10028', NULL,  1000 ), 
( 10029, TRUE,     FALSE,       'APROBADO', 'nomAn 10029', 'apeAn 10029', 'emailAn 10029', 'An', 'anPass 10029', NULL,  1000 ), 
( 10030, TRUE,     FALSE,       'APROBADO', 'nomAn 10030', 'apeAn 10030', 'emailAn 10030', 'An', 'anPass 10030', NULL,  1000 ), 
( 10031, TRUE,     FALSE,       'PENDIENTE', 'nomAn 10031', 'apeAn 10031', 'emailAn 10031', 'An', 'anPass 10031', NULL,  1000 ), 
( 10032, TRUE,     FALSE,       'APROBADO', 'nomAn 10032', 'apeAn 10032', 'emailAn 10032', 'An', 'anPass 10032', NULL,  1000 ), 
( 10033, FALSE,     FALSE,       'APROBADO', 'nomAn 10033', 'apeAn 10033', 'emailAn 10033', 'An', 'anPass 10033', NULL,  1000 ), 
( 10034, TRUE,     FALSE,       'APROBADO', 'nomAn 10034', 'apeAn 10034', 'emailAn 10034', 'An', 'anPass 10034', NULL,  1000 ), 
( 10035, TRUE,     TRUE,       'APROBADO', 'nomAn 10035', 'apeAn 10035', 'emailAn 10035', 'An', 'anPass 10035', NULL,  1000 ), 
( 10036, TRUE,     FALSE,       'RECHAZADO', 'nomAn 10036', 'apeAn 10036', 'emailAn 10036', 'An', 'anPass 10036', NULL,  1000 ), 
( 10037, TRUE,     FALSE,       'APROBADO', 'nomAn 10037', 'apeAn 10037', 'emailAn 10037', 'An', 'anPass 10037', NULL,  1000 ), 
( 10038, TRUE,     TRUE,       'APROBADO', 'nomAn 10038', 'apeAn 10038', 'emailAn 10038', 'An', 'anPass 10038', NULL,  1000 ), 
( 10039, TRUE,     FALSE,       'APROBADO', 'nomAn 10039', 'apeAn 10039', 'emailAn 10039', 'An', 'anPass 10039', NULL,  1000 ), 
( 10040, TRUE,     FALSE,       'PENDIENTE', 'nomAn 10040', 'apeAn 10040', 'emailAn 10040', 'An', 'anPass 10040', NULL,  1000 ), 
( 10041, TRUE,     FALSE,       'APROBADO', 'nomAn 10041', 'apeAn 10041', 'emailAn 10041', 'An', 'anPass 10041', NULL,  1000 ), 
( 10042, TRUE,     FALSE,       'APROBADO', 'nomAn 10042', 'apeAn 10042', 'emailAn 10042', 'An', 'anPass 10042', NULL,  1000 ), 
( 10043, FALSE,     FALSE,       'APROBADO', 'nomAn 10043', 'apeAn 10043', 'emailAn 10043', 'An', 'anPass 10043', NULL,  1000 ), 
( 10044, TRUE,     FALSE,       'APROBADO', 'nomAn 10044', 'apeAn 10044', 'emailAn 10044', 'An', 'anPass 10044', NULL,  1000 ), 
( 10045, TRUE,     FALSE,       'APROBADO', 'nomAn 10045', 'apeAn 10045', 'emailAn 10045', 'An', 'anPass 10045', NULL,  1000 ), 
( 10046, TRUE,     FALSE,       'APROBADO', 'nomAn 10046', 'apeAn 10046', 'emailAn 10046', 'An', 'anPass 10046', NULL,  1000 ), 
( 10047, TRUE,     FALSE,       'APROBADO', 'nomAn 10047', 'apeAn 10047', 'emailAn 10047', 'An', 'anPass 10047', NULL,  1000 ), 
( 10048, TRUE,     FALSE,       'APROBADO', 'nomAn 10048', 'apeAn 10048', 'emailAn 10048', 'An', 'anPass 10048', NULL,  1000 ), 
( 10049, TRUE,     FALSE,       'APROBADO', 'nomAn 10049', 'apeAn 10049', 'emailAn 10049', 'An', 'anPass 10049', NULL,  1000 ), 
( 10050, TRUE,     FALSE,       'APROBADO', 'nomAn 10050', 'apeAn 10050', 'emailAn 10050', 'An', 'anPass 10050', NULL,  1000 ), 
( 10051, TRUE,     FALSE,       'APROBADO', 'nomHu 10051', 'apeHu 10051', 'emailHu 10051', 'Hu', 'huPass 10051', NULL,  1000 ), 
( 10052, TRUE,     FALSE,       'APROBADO', 'nomHu 10052', 'apeHu 10052', 'emailHu 10052', 'Hu', 'huPass 10052', NULL,  1000 ), 
( 10053, TRUE,     FALSE,       'APROBADO', 'nomHu 10053', 'apeHu 10053', 'emailHu 10053', 'Hu', 'huPass 10053', NULL,  1000 ), 
( 10054, TRUE,     FALSE,       'APROBADO', 'nomHu 10054', 'apeHu 10054', 'emailHu 10054', 'Hu', 'huPass 10054', NULL,  1000 ), 
( 10055, TRUE,     FALSE,       'APROBADO', 'nomHu 10055', 'apeHu 10055', 'emailHu 10055', 'Hu', 'huPass 10055', NULL,  1000 ), 
( 10056, TRUE,     FALSE,       'APROBADO', 'nomHu 10056', 'apeHu 10056', 'emailHu 10056', 'Hu', 'huPass 10056', NULL,  1000 ), 
( 10057, TRUE,     FALSE,       'APROBADO', 'nomHu 10057', 'apeHu 10057', 'emailHu 10057', 'Hu', 'huPass 10057', NULL,  1000 ), 
( 10058, TRUE,     FALSE,       'APROBADO', 'nomHu 10058', 'apeHu 10058', 'emailHu 10058', 'Hu', 'huPass 10058', NULL,  1000 ), 
( 10059, TRUE,     FALSE,       'APROBADO', 'nomHu 10059', 'apeHu 10059', 'emailHu 10059', 'Hu', 'huPass 10059', NULL,  1000 ), 
( 10060, TRUE,     TRUE,       'APROBADO', 'nomHu 10060', 'apeHu 10060', 'emailHu 10060', 'Hu', 'huPass 10060', NULL,  1000 ), 
( 10061, TRUE,     FALSE,       'APROBADO', 'nomHu 10061', 'apeHu 10061', 'emailHu 10061', 'Hu', 'huPass 10061', NULL,  1000 ), 
( 10062, TRUE,     FALSE,       'APROBADO', 'nomHu 10062', 'apeHu 10062', 'emailHu 10062', 'Hu', 'huPass 10062', NULL,  1000 ), 
( 10063, TRUE,     FALSE,       'APROBADO', 'nomHu 10063', 'apeHu 10063', 'emailHu 10063', 'Hu', 'huPass 10063', NULL,  1000 ), 
( 10064, TRUE,     FALSE,       'APROBADO', 'nomHu 10064', 'apeHu 10064', 'emailHu 10064', 'Hu', 'huPass 10064', NULL,  1000 ), 
( 10065, TRUE,     FALSE,       'APROBADO', 'nomHu 10065', 'apeHu 10065', 'emailHu 10065', 'Hu', 'huPass 10065', NULL,  1000 ), 
( 10066, TRUE,     FALSE,       'APROBADO', 'nomHu 10066', 'apeHu 10066', 'emailHu 10066', 'Hu', 'huPass 10066', NULL,  1000 ), 
( 10067, FALSE,     FALSE,       'APROBADO', 'nomHu 10067', 'apeHu 10067', 'emailHu 10067', 'Hu', 'huPass 10067', NULL,  1000 ), 
( 10068, TRUE,     FALSE,       'APROBADO', 'nomHu 10068', 'apeHu 10068', 'emailHu 10068', 'Hu', 'huPass 10068', NULL,  1000 ), 
( 10069, TRUE,     FALSE,       'APROBADO', 'nomHu 10069', 'apeHu 10069', 'emailHu 10069', 'Hu', 'huPass 10069', NULL,  1000 ), 
( 10070, TRUE,     FALSE,       'APROBADO', 'nomHu 10070', 'apeHu 10070', 'emailHu 10070', 'Hu', 'huPass 10070', NULL,  1000 ), 
( 10071, TRUE,     FALSE,       'APROBADO', 'nomHu 10071', 'apeHu 10071', 'emailHu 10071', 'Hu', 'huPass 10071', NULL,  1000 ), 
( 10072, TRUE,     FALSE,       'APROBADO', 'nomHu 10072', 'apeHu 10072', 'emailHu 10072', 'Hu', 'huPass 10072', NULL,  1000 ), 
( 10073, FALSE,     FALSE,       'APROBADO', 'nomHu 10073', 'apeHu 10073', 'emailHu 10073', 'Hu', 'huPass 10073', NULL,  1000 ), 
( 10074, TRUE,     FALSE,       'APROBADO', 'nomHu 10074', 'apeHu 10074', 'emailHu 10074', 'Hu', 'huPass 10074', NULL,  1000 ), 
( 10075, TRUE,     FALSE,       'APROBADO', 'nomHu 10075', 'apeHu 10075', 'emailHu 10075', 'Hu', 'huPass 10075', NULL,  1000 ), 
( 10076, TRUE,     FALSE,       'APROBADO', 'nomHu 10076', 'apeHu 10076', 'emailHu 10076', 'Hu', 'huPass 10076', NULL,  1000 ), 
( 10077, TRUE,     FALSE,       'APROBADO', 'nomHu 10077', 'apeHu 10077', 'emailHu 10077', 'Hu', 'huPass 10077', NULL,  1000 ), 
( 10078, TRUE,     FALSE,       'APROBADO', 'nomHu 10078', 'apeHu 10078', 'emailHu 10078', 'Hu', 'huPass 10078', NULL,  1000 ), 
( 10079, TRUE,     FALSE,       'APROBADO', 'nomHu 10079', 'apeHu 10079', 'emailHu 10079', 'Hu', 'huPass 10079', NULL,  1000 ), 
( 10080, TRUE,     FALSE,       'APROBADO', 'nomHu 10080', 'apeHu 10080', 'emailHu 10080', 'Hu', 'huPass 10080', NULL,  1000 ), 
( 10081, TRUE,     FALSE,       'APROBADO', 'nomHu 10081', 'apeHu 10081', 'emailHu 10081', 'Hu', 'huPass 10081', NULL,  1000 ), 
( 10082, TRUE,     FALSE,       'APROBADO', 'nomHu 10082', 'apeHu 10082', 'emailHu 10082', 'Hu', 'huPass 10082', NULL,  1000 ), 
( 10083, TRUE,     FALSE,       'APROBADO', 'nomHu 10083', 'apeHu 10083', 'emailHu 10083', 'Hu', 'huPass 10083', NULL,  1000 ), 
( 10084, TRUE,     TRUE,       'APROBADO', 'nomHu 10084', 'apeHu 10084', 'emailHu 10084', 'Hu', 'huPass 10084', NULL,  1000 ), 
( 10085, TRUE,     FALSE,       'APROBADO', 'nomHu 10085', 'apeHu 10085', 'emailHu 10085', 'Hu', 'huPass 10085', NULL,  1000 ), 
( 10086, TRUE,     FALSE,       'APROBADO', 'nomHu 10086', 'apeHu 10086', 'emailHu 10086', 'Hu', 'huPass 10086', NULL,  1000 ), 
( 10087, TRUE,     FALSE,       'APROBADO', 'nomHu 10087', 'apeHu 10087', 'emailHu 10087', 'Hu', 'huPass 10087', NULL,  1000 ), 
( 10088, TRUE,     FALSE,       'APROBADO', 'nomHu 10088', 'apeHu 10088', 'emailHu 10088', 'Hu', 'huPass 10088', NULL,  1000 ), 
( 10089, TRUE,     FALSE,       'APROBADO', 'nomHu 10089', 'apeHu 10089', 'emailHu 10089', 'Hu', 'huPass 10089', NULL,  1000 ), 
( 10090, TRUE,     FALSE,       'RECHAZADO', 'nomHu 10090', 'apeHu 10090', 'emailHu 10090', 'Hu', 'huPass 10090', NULL,  1000 ), 
( 10091, TRUE,     FALSE,       'RECHAZADO', 'nomHu 10091', 'apeHu 10091', 'emailHu 10091', 'Hu', 'huPass 10091', NULL,  1000 ), 
( 10092, FALSE,     FALSE,       'RECHAZADO', 'nomHu 10092', 'apeHu 10092', 'emailHu 10092', 'Hu', 'huPass 10092', NULL,  1000 ), 
( 10093, TRUE,     FALSE,       'RECHAZADO', 'nomHu 10093', 'apeHu 10093', 'emailHu 10093', 'Hu', 'huPass 10093', NULL,  1000 ), 
( 10094, TRUE,     FALSE,       'APROBADO', 'nomHu 10094', 'apeHu 10094', 'emailHu 10094', 'Hu', 'huPass 10094', NULL,  1000 ), 
( 10095, TRUE,     FALSE,       'APROBADO', 'nomHu 10095', 'apeHu 10095', 'emailHu 10095', 'Hu', 'huPass 10095', NULL,  1000 ), 
( 10096, TRUE,     FALSE,       'APROBADO', 'nomHu 10096', 'apeHu 10096', 'emailHu 10096', 'Hu', 'huPass 10096', NULL,  1000 ), 
( 10097, TRUE,     TRUE,       'APROBADO', 'nomHu 10097', 'apeHu 10097', 'emailHu 10097', 'Hu', 'huPass 10097', NULL,  1000 ), 
( 10098, TRUE,     FALSE,       'APROBADO', 'nomHu 10098', 'apeHu 10098', 'emailHu 10098', 'Hu', 'huPass 10098', NULL,  1000 ), 
( 10099, TRUE,     FALSE,       'APROBADO', 'nomHu 10099', 'apeHu 10099', 'emailHu 10099', 'Hu', 'huPass 10099', NULL,  1000 ), 
( 100100, TRUE,     FALSE,       'APROBADO', 'nomHu 100100', 'apeHu 100100', 'emailHu 100100', 'Hu', 'huPass 100100', NULL,  1000 ), 
( 100101, TRUE,     FALSE,       'APROBADO', 'nomHu 100101', 'apeHu 100101', 'emailHu 100101', 'Hu', 'huPass 100101', NULL,  1000 ), 
( 100102, TRUE,     FALSE,       'APROBADO', 'nomHu 100102', 'apeHu 100102', 'emailHu 100102', 'Hu', 'huPass 100102', NULL,  1000 ), 
( 100103, TRUE,     FALSE,       'APROBADO', 'nomHu 100103', 'apeHu 100103', 'emailHu 100103', 'Hu', 'huPass 100103', NULL,  1000 ), 
( 100104, TRUE,     FALSE,       'APROBADO', 'nomHu 100104', 'apeHu 100104', 'emailHu 100104', 'Hu', 'huPass 100104', NULL,  1000 ), 
( 100105, TRUE,     FALSE,       'APROBADO', 'nomHu 100105', 'apeHu 100105', 'emailHu 100105', 'Hu', 'huPass 100105', NULL,  1000 ), 
( 100106, TRUE,     FALSE,       'APROBADO', 'nomHu 100106', 'apeHu 100106', 'emailHu 100106', 'Hu', 'huPass 100106', NULL,  1000 ), 
( 100107, TRUE,     FALSE,       'APROBADO', 'nomHu 100107', 'apeHu 100107', 'emailHu 100107', 'Hu', 'huPass 100107', NULL,  1000 ), 
( 100108, TRUE,     FALSE,       'APROBADO', 'nomHu 100108', 'apeHu 100108', 'emailHu 100108', 'Hu', 'huPass 100108', NULL,  1000 ), 
( 100109, TRUE,     FALSE,       'APROBADO', 'nomHu 100109', 'apeHu 100109', 'emailHu 100109', 'Hu', 'huPass 100109', NULL,  1000 ), 
( 100110, TRUE,     FALSE,       'APROBADO', 'nomHu 100110', 'apeHu 100110', 'emailHu 100110', 'Hu', 'huPass 100110', NULL,  1000 ), 
( 100111, TRUE,     FALSE,       'APROBADO', 'nomHu 100111', 'apeHu 100111', 'emailHu 100111', 'Hu', 'huPass 100111', NULL,  1000 ), 
( 100112, TRUE,     FALSE,       'APROBADO', 'nomHu 100112', 'apeHu 100112', 'emailHu 100112', 'Hu', 'huPass 100112', NULL,  1000 ), 
( 100113, TRUE,     FALSE,       'APROBADO', 'nomHu 100113', 'apeHu 100113', 'emailHu 100113', 'Hu', 'huPass 100113', NULL,  1000 ), 
( 100114, TRUE,     FALSE,       'APROBADO', 'nomHu 100114', 'apeHu 100114', 'emailHu 100114', 'Hu', 'huPass 100114', NULL,  1000 ), 
( 100115, TRUE,     TRUE,       'APROBADO', 'nomHu 100115', 'apeHu 100115', 'emailHu 100115', 'Hu', 'huPass 100115', NULL,  1000 ), 
( 100116, TRUE,     FALSE,       'APROBADO', 'nomHu 100116', 'apeHu 100116', 'emailHu 100116', 'Hu', 'huPass 100116', NULL,  1000 ), 
( 100117, TRUE,     FALSE,       'APROBADO', 'nomHu 100117', 'apeHu 100117', 'emailHu 100117', 'Hu', 'huPass 100117', NULL,  1000 ), 
( 100118, TRUE,     FALSE,       'APROBADO', 'nomHu 100118', 'apeHu 100118', 'emailHu 100118', 'Hu', 'huPass 100118', NULL,  1000 ), 
( 100119, TRUE,     FALSE,       'APROBADO', 'nomHu 100119', 'apeHu 100119', 'emailHu 100119', 'Hu', 'huPass 100119', NULL,  1000 ), 
( 100120, TRUE,     FALSE,       'APROBADO', 'nomHu 100120', 'apeHu 100120', 'emailHu 100120', 'Hu', 'huPass 100120', NULL,  1000 ), 
( 100121, TRUE,     FALSE,       'APROBADO', 'nomHu 100121', 'apeHu 100121', 'emailHu 100121', 'Hu', 'huPass 100121', NULL,  1000 ), 
( 100122, TRUE,     FALSE,       'APROBADO', 'nomHu 100122', 'apeHu 100122', 'emailHu 100122', 'Hu', 'huPass 100122', NULL,  1000 ), 
( 100123, TRUE,     FALSE,       'APROBADO', 'nomHu 100123', 'apeHu 100123', 'emailHu 100123', 'Hu', 'huPass 100123', NULL,  1000 ), 
( 100124, TRUE,     TRUE,       'APROBADO', 'nomHu 100124', 'apeHu 100124', 'emailHu 100124', 'Hu', 'huPass 100124', NULL,  1000 ), 
( 100125, TRUE,     FALSE,       'APROBADO', 'nomHu 100125', 'apeHu 100125', 'emailHu 100125', 'Hu', 'huPass 100125', NULL,  1000 ), 
( 100126, TRUE,     FALSE,       'PENDIENTE', 'nomHu 100126', 'apeHu 100126', 'emailHu 100126', 'Hu', 'huPass 100126', NULL,  1000 ), 
( 100127, TRUE,     FALSE,       'APROBADO', 'nomHu 100127', 'apeHu 100127', 'emailHu 100127', 'Hu', 'huPass 100127', NULL,  1000 ), 
( 100128, TRUE,     FALSE,       'APROBADO', 'nomHu 100128', 'apeHu 100128', 'emailHu 100128', 'Hu', 'huPass 100128', NULL,  1000 ), 
( 100129, TRUE,     FALSE,       'APROBADO', 'nomHu 100129', 'apeHu 100129', 'emailHu 100129', 'Hu', 'huPass 100129', NULL,  1000 ), 
( 100130, TRUE,     FALSE,       'APROBADO', 'nomHu 100130', 'apeHu 100130', 'emailHu 100130', 'Hu', 'huPass 100130', NULL,  1000 ), 
( 100131, TRUE,     FALSE,       'PENDIENTE', 'nomHu 100131', 'apeHu 100131', 'emailHu 100131', 'Hu', 'huPass 100131', NULL,  1000 ), 
( 100132, TRUE,     FALSE,       'APROBADO', 'nomHu 100132', 'apeHu 100132', 'emailHu 100132', 'Hu', 'huPass 100132', NULL,  1000 ), 
( 100133, TRUE,     FALSE,       'APROBADO', 'nomHu 100133', 'apeHu 100133', 'emailHu 100133', 'Hu', 'huPass 100133', NULL,  1000 ), 
( 100134, TRUE,     FALSE,       'APROBADO', 'nomHu 100134', 'apeHu 100134', 'emailHu 100134', 'Hu', 'huPass 100134', NULL,  1000 ), 
( 100135, TRUE,     FALSE,       'APROBADO', 'nomHu 100135', 'apeHu 100135', 'emailHu 100135', 'Hu', 'huPass 100135', NULL,  1000 ), 
( 100136, TRUE,     FALSE,       'APROBADO', 'nomHu 100136', 'apeHu 100136', 'emailHu 100136', 'Hu', 'huPass 100136', NULL,  1000 ), 
( 100137, TRUE,     FALSE,       'APROBADO', 'nomHu 100137', 'apeHu 100137', 'emailHu 100137', 'Hu', 'huPass 100137', NULL,  1000 ), 
( 100138, TRUE,     FALSE,       'APROBADO', 'nomHu 100138', 'apeHu 100138', 'emailHu 100138', 'Hu', 'huPass 100138', NULL,  1000 ), 
( 100139, TRUE,     FALSE,       'APROBADO', 'nomHu 100139', 'apeHu 100139', 'emailHu 100139', 'Hu', 'huPass 100139', NULL,  1000 ), 
( 100140, TRUE,     FALSE,       'APROBADO', 'nomHu 100140', 'apeHu 100140', 'emailHu 100140', 'Hu', 'huPass 100140', NULL,  1000 ), 
( 100141, TRUE,     FALSE,       'PENDIENTE', 'nomHu 100141', 'apeHu 100141', 'emailHu 100141', 'Hu', 'huPass 100141', NULL,  1000 ), 
( 100142, TRUE,     FALSE,       'APROBADO', 'nomHu 100142', 'apeHu 100142', 'emailHu 100142', 'Hu', 'huPass 100142', NULL,  1000 ), 
( 100143, TRUE,     FALSE,       'APROBADO', 'nomHu 100143', 'apeHu 100143', 'emailHu 100143', 'Hu', 'huPass 100143', NULL,  1000 ), 
( 100144, TRUE,     FALSE,       'APROBADO', 'nomHu 100144', 'apeHu 100144', 'emailHu 100144', 'Hu', 'huPass 100144', NULL,  1000 ), 
( 100145, TRUE,     FALSE,       'APROBADO', 'nomHu 100145', 'apeHu 100145', 'emailHu 100145', 'Hu', 'huPass 100145', NULL,  1000 ), 
( 100146, TRUE,     FALSE,       'APROBADO', 'nomHu 100146', 'apeHu 100146', 'emailHu 100146', 'Hu', 'huPass 100146', NULL,  1000 ), 
( 100147, TRUE,     FALSE,       'APROBADO', 'nomHu 100147', 'apeHu 100147', 'emailHu 100147', 'Hu', 'huPass 100147', NULL,  1000 ), 
( 100148, TRUE,     FALSE,       'APROBADO', 'nomHu 100148', 'apeHu 100148', 'emailHu 100148', 'Hu', 'huPass 100148', NULL,  1000 ), 
( 100149, TRUE,     FALSE,       'APROBADO', 'nomHu 100149', 'apeHu 100149', 'emailHu 100149', 'Hu', 'huPass 100149', NULL,  1000 ), 
( 100150, TRUE,     FALSE,       'APROBADO', 'nomHu 100150', 'apeHu 100150', 'emailHu 100150', 'Hu', 'huPass 100150', NULL,  1000 );


INSERT INTO dt_pais (nombre) VALUES ('Afganistán'); 
INSERT INTO dt_pais (nombre) VALUES ('Albania'); 
INSERT INTO dt_pais (nombre) VALUES ('Alemania'); 
INSERT INTO dt_pais (nombre) VALUES ('Andorra'); 
INSERT INTO dt_pais (nombre) VALUES ('Ango'); 
INSERT INTO dt_pais (nombre) VALUES ('Antigua y Barbuda'); 
INSERT INTO dt_pais (nombre) VALUES ('Arabia Saudita'); 
INSERT INTO dt_pais (nombre) VALUES ('Argia'); 
INSERT INTO dt_pais (nombre) VALUES ('Argentina'); 
INSERT INTO dt_pais (nombre) VALUES ('Armenia'); 
INSERT INTO dt_pais (nombre) VALUES ('Australia'); 
INSERT INTO dt_pais (nombre) VALUES ('Austria'); 
INSERT INTO dt_pais (nombre) VALUES ('Azerbaiyán'); 
INSERT INTO dt_pais (nombre) VALUES ('Bahamas s'); 
INSERT INTO dt_pais (nombre) VALUES ('Bahrein'); 
INSERT INTO dt_pais (nombre) VALUES ('Bangdesh'); 
INSERT INTO dt_pais (nombre) VALUES ('Barbados'); 
INSERT INTO dt_pais (nombre) VALUES ('Barús'); 
INSERT INTO dt_pais (nombre) VALUES ('Bélgica'); 
INSERT INTO dt_pais (nombre) VALUES ('Bice'); 
INSERT INTO dt_pais (nombre) VALUES ('Benin'); 
INSERT INTO dt_pais (nombre) VALUES ('Bhután'); 
INSERT INTO dt_pais (nombre) VALUES ('Bolivia Estado Plurinacional de'); 
INSERT INTO dt_pais (nombre) VALUES ('Bosnia y Herzegovina'); 
INSERT INTO dt_pais (nombre) VALUES ('Botswana'); 
INSERT INTO dt_pais (nombre) VALUES ('Brasil'); 
INSERT INTO dt_pais (nombre) VALUES ('Brunei Darussam'); 
INSERT INTO dt_pais (nombre) VALUES ('Bulgaria'); 
INSERT INTO dt_pais (nombre) VALUES ('Burkina Faso'); 
INSERT INTO dt_pais (nombre) VALUES ('Burundi'); 
INSERT INTO dt_pais (nombre) VALUES ('Cabo Verde'); 
INSERT INTO dt_pais (nombre) VALUES ('Camboya'); 
INSERT INTO dt_pais (nombre) VALUES ('Camerún'); 
INSERT INTO dt_pais (nombre) VALUES ('Canadá'); 
INSERT INTO dt_pais (nombre) VALUES ('Chad'); 
INSERT INTO dt_pais (nombre) VALUES ('Chequia'); 
INSERT INTO dt_pais (nombre) VALUES ('Chile'); 
INSERT INTO dt_pais (nombre) VALUES ('China'); 
INSERT INTO dt_pais (nombre) VALUES ('Chipre'); 
INSERT INTO dt_pais (nombre) VALUES ('Colombia'); 
INSERT INTO dt_pais (nombre) VALUES ('Comoras s'); 
INSERT INTO dt_pais (nombre) VALUES ('Congo'); 
INSERT INTO dt_pais (nombre) VALUES ('Costa Rica'); 
INSERT INTO dt_pais (nombre) VALUES ('Côte d’Ivoire'); 
INSERT INTO dt_pais (nombre) VALUES ('Croacia'); 
INSERT INTO dt_pais (nombre) VALUES ('Cuba'); 
INSERT INTO dt_pais (nombre) VALUES ('Dinamarca'); 
INSERT INTO dt_pais (nombre) VALUES ('Djibouti'); 
INSERT INTO dt_pais (nombre) VALUES ('Dominica'); 
INSERT INTO dt_pais (nombre) VALUES ('Ecuador'); 
INSERT INTO dt_pais (nombre) VALUES ('Egipto'); 
INSERT INTO dt_pais (nombre) VALUES (' Salvador'); 
INSERT INTO dt_pais (nombre) VALUES ('Emiratos Árabes Unidos'); 
INSERT INTO dt_pais (nombre) VALUES ('Eritrea'); 
INSERT INTO dt_pais (nombre) VALUES ('Eslovaquia'); 
INSERT INTO dt_pais (nombre) VALUES ('Eslovenia'); 
INSERT INTO dt_pais (nombre) VALUES ('España'); 
INSERT INTO dt_pais (nombre) VALUES ('Estados Unidos de América'); 
INSERT INTO dt_pais (nombre) VALUES ('Estonia'); 
INSERT INTO dt_pais (nombre) VALUES ('Eswatini'); 
INSERT INTO dt_pais (nombre) VALUES ('Etiopía'); 
INSERT INTO dt_pais (nombre) VALUES ('Federación de Rusia'); 
INSERT INTO dt_pais (nombre) VALUES ('Fiji'); 
INSERT INTO dt_pais (nombre) VALUES ('Filipinas'); 
INSERT INTO dt_pais (nombre) VALUES ('Finndia'); 
INSERT INTO dt_pais (nombre) VALUES ('Francia'); 
INSERT INTO dt_pais (nombre) VALUES ('Gabón'); 
INSERT INTO dt_pais (nombre) VALUES ('Gambia'); 
INSERT INTO dt_pais (nombre) VALUES ('Georgia'); 
INSERT INTO dt_pais (nombre) VALUES ('Ghana'); 
INSERT INTO dt_pais (nombre) VALUES ('Granada'); 
INSERT INTO dt_pais (nombre) VALUES ('Grecia'); 
INSERT INTO dt_pais (nombre) VALUES ('Guatema'); 
INSERT INTO dt_pais (nombre) VALUES ('Guinea'); 
INSERT INTO dt_pais (nombre) VALUES ('Guinea Ecuatorial'); 
INSERT INTO dt_pais (nombre) VALUES ('Guinea-Bissau'); 
INSERT INTO dt_pais (nombre) VALUES ('Guyana'); 
INSERT INTO dt_pais (nombre) VALUES ('Haití'); 
INSERT INTO dt_pais (nombre) VALUES ('Honduras'); 
INSERT INTO dt_pais (nombre) VALUES ('Hungría'); 
INSERT INTO dt_pais (nombre) VALUES ('India'); 
INSERT INTO dt_pais (nombre) VALUES ('Indonesia'); 
INSERT INTO dt_pais (nombre) VALUES ('Irán República Islámica d'); 
INSERT INTO dt_pais (nombre) VALUES ('Iraq'); 
INSERT INTO dt_pais (nombre) VALUES ('Irnda'); 
INSERT INTO dt_pais (nombre) VALUES ('Isndia'); 
INSERT INTO dt_pais (nombre) VALUES ('Iss Cook s'); 
INSERT INTO dt_pais (nombre) VALUES ('Iss Marshall s'); 
INSERT INTO dt_pais (nombre) VALUES ('Iss Salomón s'); 
INSERT INTO dt_pais (nombre) VALUES ('Isra'); 
INSERT INTO dt_pais (nombre) VALUES ('Italia'); 
INSERT INTO dt_pais (nombre) VALUES ('Jamaica'); 
INSERT INTO dt_pais (nombre) VALUES ('Japón'); 
INSERT INTO dt_pais (nombre) VALUES ('Jordania'); 
INSERT INTO dt_pais (nombre) VALUES ('Kazajstán'); 
INSERT INTO dt_pais (nombre) VALUES ('Kenya'); 
INSERT INTO dt_pais (nombre) VALUES ('Kirguistán'); 
INSERT INTO dt_pais (nombre) VALUES ('Kiribati'); 
INSERT INTO dt_pais (nombre) VALUES ('Kuwait'); 
INSERT INTO dt_pais (nombre) VALUES ('Lesotho'); 
INSERT INTO dt_pais (nombre) VALUES ('Letonia'); 
INSERT INTO dt_pais (nombre) VALUES ('Líbano'); 
INSERT INTO dt_pais (nombre) VALUES ('Liberia'); 
INSERT INTO dt_pais (nombre) VALUES ('Libia'); 
INSERT INTO dt_pais (nombre) VALUES ('Liechtenstein'); 
INSERT INTO dt_pais (nombre) VALUES ('Lituania'); 
INSERT INTO dt_pais (nombre) VALUES ('Luxemburgo'); 
INSERT INTO dt_pais (nombre) VALUES ('Madagascar'); 
INSERT INTO dt_pais (nombre) VALUES ('Masia'); 
INSERT INTO dt_pais (nombre) VALUES ('Mawi'); 
INSERT INTO dt_pais (nombre) VALUES ('Maldivas'); 
INSERT INTO dt_pais (nombre) VALUES ('Malí'); 
INSERT INTO dt_pais (nombre) VALUES ('Malta'); 
INSERT INTO dt_pais (nombre) VALUES ('Marruecos'); 
INSERT INTO dt_pais (nombre) VALUES ('Mauricio'); 
INSERT INTO dt_pais (nombre) VALUES ('Mauritania'); 
INSERT INTO dt_pais (nombre) VALUES ('México'); 
INSERT INTO dt_pais (nombre) VALUES ('Micronesia Estados Federados de'); 
INSERT INTO dt_pais (nombre) VALUES ('Mónaco'); 
INSERT INTO dt_pais (nombre) VALUES ('Mongolia'); 
INSERT INTO dt_pais (nombre) VALUES ('Montenegro'); 
INSERT INTO dt_pais (nombre) VALUES ('Mozambique'); 
INSERT INTO dt_pais (nombre) VALUES ('Myanmar'); 
INSERT INTO dt_pais (nombre) VALUES ('Namibia'); 
INSERT INTO dt_pais (nombre) VALUES ('Nauru'); 
INSERT INTO dt_pais (nombre) VALUES ('Nepal'); 
INSERT INTO dt_pais (nombre) VALUES ('Nicaragua'); 
INSERT INTO dt_pais (nombre) VALUES ('Níger'); 
INSERT INTO dt_pais (nombre) VALUES ('Nigeria'); 
INSERT INTO dt_pais (nombre) VALUES ('Niue'); 
INSERT INTO dt_pais (nombre) VALUES ('Noruega'); 
INSERT INTO dt_pais (nombre) VALUES ('Nueva Zandia'); 
INSERT INTO dt_pais (nombre) VALUES ('Omán'); 
INSERT INTO dt_pais (nombre) VALUES ('Países Bajos'); 
INSERT INTO dt_pais (nombre) VALUES ('Pakistán'); 
INSERT INTO dt_pais (nombre) VALUES ('Pau'); 
INSERT INTO dt_pais (nombre) VALUES ('Panamá'); 
INSERT INTO dt_pais (nombre) VALUES ('Papua Nueva Guinea'); 
INSERT INTO dt_pais (nombre) VALUES ('Paraguay'); 
INSERT INTO dt_pais (nombre) VALUES ('Perú'); 
INSERT INTO dt_pais (nombre) VALUES ('Polonia'); 
INSERT INTO dt_pais (nombre) VALUES ('Portugal'); 
INSERT INTO dt_pais (nombre) VALUES ('Qatar'); 
INSERT INTO dt_pais (nombre) VALUES ('Reino Unido de Gran Bretaña e Irnda d Norte'); 
INSERT INTO dt_pais (nombre) VALUES ('República Árabe Siria'); 
INSERT INTO dt_pais (nombre) VALUES ('República Centroafricana'); 
INSERT INTO dt_pais (nombre) VALUES ('República de Corea'); 
INSERT INTO dt_pais (nombre) VALUES ('República de Macedonia d Norte'); 
INSERT INTO dt_pais (nombre) VALUES ('Nombre corto: Macedonia d Norte'); 
INSERT INTO dt_pais (nombre) VALUES ('República de Moldova'); 
INSERT INTO dt_pais (nombre) VALUES ('República Democrática d Congo'); 
INSERT INTO dt_pais (nombre) VALUES ('República Democrática Popur o'); 
INSERT INTO dt_pais (nombre) VALUES ('República Dominicana'); 
INSERT INTO dt_pais (nombre) VALUES ('República Popur Democrática de Corea'); 
INSERT INTO dt_pais (nombre) VALUES ('República Unida de Tanzanía'); 
INSERT INTO dt_pais (nombre) VALUES ('Rumania'); 
INSERT INTO dt_pais (nombre) VALUES ('Rwanda'); 
INSERT INTO dt_pais (nombre) VALUES ('Saint Kitts y Nevis'); 
INSERT INTO dt_pais (nombre) VALUES ('Samoa'); 
INSERT INTO dt_pais (nombre) VALUES ('San Marino'); 
INSERT INTO dt_pais (nombre) VALUES ('San Vicente y s Granadinas'); 
INSERT INTO dt_pais (nombre) VALUES ('Santa Lucía'); 
INSERT INTO dt_pais (nombre) VALUES ('Santa Sede'); 
INSERT INTO dt_pais (nombre) VALUES ('Santo Tomé y Príncipe'); 
INSERT INTO dt_pais (nombre) VALUES ('Senegal'); 
INSERT INTO dt_pais (nombre) VALUES ('Serbia'); 
INSERT INTO dt_pais (nombre) VALUES ('Seychles'); 
INSERT INTO dt_pais (nombre) VALUES ('Sierra Leona'); 
INSERT INTO dt_pais (nombre) VALUES ('Singapur'); 
INSERT INTO dt_pais (nombre) VALUES ('Somalia'); 
INSERT INTO dt_pais (nombre) VALUES ('Sri nka'); 
INSERT INTO dt_pais (nombre) VALUES ('Sudáfrica'); 
INSERT INTO dt_pais (nombre) VALUES ('Sudán'); 
INSERT INTO dt_pais (nombre) VALUES ('Sudán d Sur'); 
INSERT INTO dt_pais (nombre) VALUES ('Suecia'); 
INSERT INTO dt_pais (nombre) VALUES ('Suiza'); 
INSERT INTO dt_pais (nombre) VALUES ('Suriname'); 
INSERT INTO dt_pais (nombre) VALUES ('Taindia'); 
INSERT INTO dt_pais (nombre) VALUES ('Tayikistán'); 
INSERT INTO dt_pais (nombre) VALUES ('Timor-Leste'); 
INSERT INTO dt_pais (nombre) VALUES ('Togo'); 
INSERT INTO dt_pais (nombre) VALUES ('Tonga'); 
INSERT INTO dt_pais (nombre) VALUES ('Trinidad y Tabago'); 
INSERT INTO dt_pais (nombre) VALUES ('Túnez'); 
INSERT INTO dt_pais (nombre) VALUES ('Turkmenistán'); 
INSERT INTO dt_pais (nombre) VALUES ('Turquía'); 
INSERT INTO dt_pais (nombre) VALUES ('Tuvalu'); 
INSERT INTO dt_pais (nombre) VALUES ('Ucrania'); 
INSERT INTO dt_pais (nombre) VALUES ('Uganda'); 
INSERT INTO dt_pais (nombre) VALUES ('Uruguay'); 
INSERT INTO dt_pais (nombre) VALUES ('Uzbekistán'); 
INSERT INTO dt_pais (nombre) VALUES ('Vanuatu'); 
INSERT INTO dt_pais (nombre) VALUES ('Venezua República Bolivariana de'); 
INSERT INTO dt_pais (nombre) VALUES ('Viet Nam'); 
INSERT INTO dt_pais (nombre) VALUES ('Yemen'); 
INSERT INTO dt_pais (nombre) VALUES ('Zambia'); 
INSERT INTO dt_pais (nombre) VALUES ('Zimbabwe'); 

INSERT INTO dt_direccion 
(id, calle, ciudad, numero, pais )
VALUES
( 1001, 'calle_dir$', 'ciudad 1001', ' 1001', '1'),
( 1002, 'calle_dir$', 'ciudad 1002', ' 1001', '1'),
( 1003, 'calle_dir$', 'ciudad 1000', ' 1001', '1'),
( 1004, 'calle_dir$', 'ciudad 1001', ' 1001', '1'),
( 1005, 'calle_dir$', 'ciudad 1002', ' 1001', '2'),
( 1006, 'calle_dir$', 'ciudad 1000', ' 1001', '1'),
( 1007, 'calle_dir$', 'ciudad 1001', ' 1001', '1'),
( 1008, 'calle_dir$', 'ciudad 1002', ' 1001', '3'),
( 1009, 'calle_dir$', 'ciudad 1000', ' 1001', '1'),
( 10010, 'calle_dir$', 'ciudad 1001', ' 1001', '1'),
( 10011, 'calle_dir$', 'ciudad 1002', ' 1001', '1'),
( 10012, 'calle_dir$', 'ciudad 1000', ' 1001', '2'),
( 10013, 'calle_dir$', 'ciudad 1001', ' 1001', '1'),
( 10014, 'calle_dir$', 'ciudad 1002', ' 1001', '1'),
( 10015, 'calle_dir$', 'ciudad 1000', ' 1001', '1'),
( 10016, 'calle_dir$', 'ciudad 1001', ' 1001', '1'),
( 10017, 'calle_dir$', 'ciudad 1002', ' 1001', '3'),
( 10018, 'calle_dir$', 'ciudad 1000', ' 1001', '1'),
( 10019, 'calle_dir$', 'ciudad 1001', ' 1001', '1'),
( 10020, 'calle_dir$', 'ciudad 1002', ' 1001', '1'),
( 10021, 'calle_dir$', 'ciudad 1000', ' 1001', '1'),
( 10022, 'calle_dir$', 'ciudad 1001', ' 1001', '1'),
( 10023, 'calle_dir$', 'ciudad 1002', ' 1001', '1'),
( 10024, 'calle_dir$', 'ciudad 1000', ' 1001', '4'),
( 10025, 'calle_dir$', 'ciudad 1001', ' 1001', '1'),
( 10026, 'calle_dir$', 'ciudad 1002', ' 1001', '1'),
( 10027, 'calle_dir$', 'ciudad 1000', ' 1001', '1'),
( 10028, 'calle_dir$', 'ciudad 1001', ' 1001', '1'),
( 10029, 'calle_dir$', 'ciudad 1002', ' 1001', '2'),
( 10030, 'calle_dir$', 'ciudad 1000', ' 1001', '1'),
( 10031, 'calle_dir$', 'ciudad 1001', ' 1001', '1'),
( 10032, 'calle_dir$', 'ciudad 1002', ' 1001', '1'),
( 10033, 'calle_dir$', 'ciudad 1000', ' 1001', '1'),
( 10034, 'calle_dir$', 'ciudad 1001', ' 1001', '1'),
( 10035, 'calle_dir$', 'ciudad 1002', ' 1001', '1'),
( 10036, 'calle_dir$', 'ciudad 1000', ' 1001', '8'),
( 10037, 'calle_dir$', 'ciudad 1001', ' 1001', '1'),
( 10038, 'calle_dir$', 'ciudad 1002', ' 1001', '1'),
( 10039, 'calle_dir$', 'ciudad 1000', ' 1001', '15'),
( 10040, 'calle_dir$', 'ciudad 1001', ' 1001', '1'),
( 10041, 'calle_dir$', 'ciudad 1002', ' 1001', '1'),
( 10042, 'calle_dir$', 'ciudad 1000', ' 1001', '8'),
( 10043, 'calle_dir$', 'ciudad 1001', ' 1001', '1'),
( 10044, 'calle_dir$', 'ciudad 1002', ' 1001', '1'),
( 10045, 'calle_dir$', 'ciudad 1000', ' 1001', '1'),
( 10046, 'calle_dir$', 'ciudad 1001', ' 1001', '15'),
( 10047, 'calle_dir$', 'ciudad 1002', ' 1001', '1'),
( 10048, 'calle_dir$', 'ciudad 1000', ' 1001', '1'),
( 10049, 'calle_dir$', 'ciudad 1001', ' 1001', '1');



INSERT INTO alojamientos  
(id, anfitrion_id, activo, alojamiento_dir, nombre, descripcion  )
VALUES
(1, 10022, TRUE,  1001, 'nombreAloj_ 10022_ 1000', 'desc_ 10022_ 1000' ), 
(2, 10023, TRUE,  1002, 'nombreAloj_ 10023_ 1000', 'desc_ 10023_ 1000' ), 
(3, 10023, TRUE,  1003, 'nombreAloj_ 10023_ 1001', 'desc_ 10023_ 1001' ), 
(4, 10025, TRUE,  1004, 'nombreAloj_ 10025_ 1000', 'desc_ 10025_ 1000' ), 
(5, 10026, TRUE,  1005, 'nombreAloj_ 10026_ 1000', 'desc_ 10026_ 1000' ), 
(6, 10026, TRUE,  1006, 'nombreAloj_ 10026_ 1001', 'desc_ 10026_ 1001' ), 
(7, 10028, TRUE,  1007, 'nombreAloj_ 10028_ 1000', 'desc_ 10028_ 1000' ), 
(8, 10029, TRUE,  1008, 'nombreAloj_ 10029_ 1000', 'desc_ 10029_ 1000' ), 
(9, 10029, TRUE,  1009, 'nombreAloj_ 10029_ 1001', 'desc_ 10029_ 1001' ), 
(10, 10031, TRUE,  10010, 'nombreAloj_ 10031_ 1000', 'desc_ 10031_ 1000' ), 
(11, 10032, TRUE,  10011, 'nombreAloj_ 10032_ 1000', 'desc_ 10032_ 1000' ), 
(12, 10032, TRUE,  10012, 'nombreAloj_ 10032_ 1001', 'desc_ 10032_ 1001' ), 
(13, 10034, TRUE,  10013, 'nombreAloj_ 10034_ 1000', 'desc_ 10034_ 1000' ), 
(14, 10035, TRUE,  10014, 'nombreAloj_ 10035_ 1000', 'desc_ 10035_ 1000' ), 
(15, 10035, TRUE,  10015, 'nombreAloj_ 10035_ 1001', 'desc_ 10035_ 1001' ), 
(16, 10037, TRUE,  10016, 'nombreAloj_ 10037_ 1000', 'desc_ 10037_ 1000' ), 
(17, 10038, TRUE,  10017, 'nombreAloj_ 10038_ 1000', 'desc_ 10038_ 1000' ), 
(18, 10038, TRUE,  10018, 'nombreAloj_ 10038_ 1001', 'desc_ 10038_ 1001' ), 
(19, 10040, TRUE,  10019, 'nombreAloj_ 10040_ 1000', 'desc_ 10040_ 1000' ), 
(20, 10041, TRUE,  10020, 'nombreAloj_ 10041_ 1000', 'desc_ 10041_ 1000' ), 
(21, 10041, TRUE,  10021, 'nombreAloj_ 10041_ 1001', 'desc_ 10041_ 1001' ), 
(22, 10043, TRUE,  10022, 'nombreAloj_ 10043_ 1000', 'desc_ 10043_ 1000' ), 
(23, 10044, TRUE,  10023, 'nombreAloj_ 10044_ 1000', 'desc_ 10044_ 1000' ), 
(24, 10044, TRUE,  10024, 'nombreAloj_ 10044_ 1001', 'desc_ 10044_ 1001' ), 
(25, 10046, TRUE,  10025, 'nombreAloj_ 10046_ 1000', 'desc_ 10046_ 1000' ), 
(26, 10047, TRUE,  10026, 'nombreAloj_ 10047_ 1000', 'desc_ 10047_ 1000' ), 
(27, 10047, TRUE,  10027, 'nombreAloj_ 10047_ 1001', 'desc_ 10047_ 1001' ), 
(28, 10049, TRUE,  10028, 'nombreAloj_ 10049_ 1000', 'desc_ 10049_ 1000' );

INSERT INTO dt_servicios VALUES  ( 101, true, true, true, true, true, true ); 
INSERT INTO dt_servicios VALUES  ( 102, true, true, true, false, false, true ); 
INSERT INTO dt_servicios VALUES  ( 103, true, false, false, false, true, true ); 
INSERT INTO dt_servicios VALUES  ( 104, true, true, true, false, true, true ); 
INSERT INTO dt_servicios VALUES  ( 105, true, false, true, false, false, true ); 
INSERT INTO dt_servicios VALUES  ( 106, false, false, false, true, false, true ); 
INSERT INTO dt_servicios VALUES  ( 107, true, true, false, false, false, true ); 
INSERT INTO dt_servicios VALUES  ( 108, true, true, false, false, false, true ); 
INSERT INTO dt_servicios VALUES  ( 109, true, false, false, true, true, true ); 
INSERT INTO dt_servicios VALUES  ( 110, true, false, true, true, false, true ); 
INSERT INTO dt_servicios VALUES  ( 111, false, false, false, true, false, false ); 
INSERT INTO dt_servicios VALUES  ( 112, false, false, false, true, true, false ); 
INSERT INTO dt_servicios VALUES  ( 113, false, true, false, true, false, false ); 
INSERT INTO dt_servicios VALUES  ( 114, true, true, false, true, false, true ); 
INSERT INTO dt_servicios VALUES  ( 115, false, false, true, false, false, true ); 
INSERT INTO dt_servicios VALUES  ( 116, true, true, false, true, true, false ); 
INSERT INTO dt_servicios VALUES  ( 117, false, false, false, true, true, false ); 
INSERT INTO dt_servicios VALUES  ( 118, true, true, true, true, true, true ); 
INSERT INTO dt_servicios VALUES  ( 119, false, true, true, false, true, false ); 
INSERT INTO dt_servicios VALUES  ( 120, false, true, true, false, true, true ); 
INSERT INTO dt_servicios VALUES  ( 121, true, true, false, true, false, false ); 
INSERT INTO dt_servicios VALUES  ( 122, true, false, false, true, true, false ); 
INSERT INTO dt_servicios VALUES  ( 123, false, false, false, true, true, false ); 
INSERT INTO dt_servicios VALUES  ( 124, true, true, false, false, false, false ); 
INSERT INTO dt_servicios VALUES  ( 125, false, false, false, true, false, false ); 
INSERT INTO dt_servicios VALUES  ( 126, true, false, false, true, false, true ); 
INSERT INTO dt_servicios VALUES  ( 127, true, true, false, true, false, false ); 
INSERT INTO dt_servicios VALUES  ( 128, false, true, false, false, true, false ); 


INSERT INTO habitaciones VALUES (101, 2 , 'Desc hab 101', 500, 1, 101);
INSERT INTO habitaciones VALUES (102, 4 , 'Desc hab 102', 1400, 2, 102);
INSERT INTO habitaciones VALUES (103, 1 , 'Desc hab 103', 1200, 3, 103);
INSERT INTO habitaciones VALUES (104, 1 , 'Desc hab 104', 1500, 4, 104);
INSERT INTO habitaciones VALUES (105, 1 , 'Desc hab 105', 500, 5, 105);
INSERT INTO habitaciones VALUES (106, 2 , 'Desc hab 106', 1250, 6, 106);
INSERT INTO habitaciones VALUES (107, 2 , 'Desc hab 107', 1350, 7, 107);
INSERT INTO habitaciones VALUES (108, 3 , 'Desc hab 108', 1450, 8, 108);
INSERT INTO habitaciones VALUES (109, 2 , 'Desc hab 109', 1200, 9, 109);
INSERT INTO habitaciones VALUES (110, 1 , 'Desc hab 110', 1150, 10, 110);
INSERT INTO habitaciones VALUES (111, 3 , 'Desc hab 111', 1100, 11, 111);
INSERT INTO habitaciones VALUES (112, 2 , 'Desc hab 112', 1050, 12, 112);
INSERT INTO habitaciones VALUES (113, 3 , 'Desc hab 113', 750, 13, 113);
INSERT INTO habitaciones VALUES (114, 1 , 'Desc hab 114', 1050, 14, 114);
INSERT INTO habitaciones VALUES (115, 2 , 'Desc hab 115', 750, 15, 115);
INSERT INTO habitaciones VALUES (116, 2 , 'Desc hab 116', 1500, 16, 116);
INSERT INTO habitaciones VALUES (117, 4 , 'Desc hab 117', 750, 17, 117);
INSERT INTO habitaciones VALUES (118, 3 , 'Desc hab 118', 1150, 18, 118);
INSERT INTO habitaciones VALUES (119, 4 , 'Desc hab 119', 800, 19, 119);
INSERT INTO habitaciones VALUES (120, 3 , 'Desc hab 120', 1100, 20, 120);
INSERT INTO habitaciones VALUES (121, 2 , 'Desc hab 121', 1200, 21, 121);
INSERT INTO habitaciones VALUES (122, 1 , 'Desc hab 122', 900, 22, 122);
INSERT INTO habitaciones VALUES (123, 1 , 'Desc hab 123', 550, 23, 123);
INSERT INTO habitaciones VALUES (124, 4 , 'Desc hab 124', 500, 24, 124);
INSERT INTO habitaciones VALUES (125, 1 , 'Desc hab 125', 1000, 25, 125);
INSERT INTO habitaciones VALUES (126, 1 , 'Desc hab 126', 850, 26, 126);
INSERT INTO habitaciones VALUES (127, 2 , 'Desc hab 127', 1150, 27, 127);
INSERT INTO habitaciones VALUES (128, 3 , 'Desc hab 128', 1150, 28, 128);

INSERT INTO calificaciones VALUES (351, 3 , '4', '2022-05-03', 'RESEnA 351');
INSERT INTO calificaciones VALUES (353, 4 , '2', '2022-05-05', 'RESEÑA 353');
INSERT INTO calificaciones VALUES (355, 2 , '5', '2022-05-06', 'RESEÑA 355');
INSERT INTO calificaciones VALUES (357, 5 , '4', '2022-05-07', 'RESEÑA 357');
INSERT INTO calificaciones VALUES (359, 4 , '2', '2022-05-08', 'RESEÑA 359');
INSERT INTO calificaciones VALUES (361, 5 , '4', '2022-05-09', 'RESEÑA 361');
INSERT INTO calificaciones VALUES (363, 2 , '3', '2022-05-10', 'RESEÑA 363');
INSERT INTO calificaciones VALUES (365, 5 , '5', '2022-05-11', 'RESEÑA 365');
INSERT INTO calificaciones VALUES (367, 2 , '3', '2022-05-12', 'RESEÑA 367');
INSERT INTO calificaciones VALUES (369, 4 , '4', '2022-05-13', 'RESEÑA 369');
INSERT INTO calificaciones VALUES (371, 1 , '5', '2022-05-14', 'RESEÑA 371');
INSERT INTO calificaciones VALUES (373, 4 , '3', '2022-05-15', 'RESEÑA 373');
INSERT INTO calificaciones VALUES (375, 4 , '1', '2022-05-16', 'RESEÑA 375');
INSERT INTO calificaciones VALUES (377, 5 , '1', '2022-05-17', 'RESEÑA 377');
INSERT INTO calificaciones VALUES (379, 1 , '1', '2022-05-18', 'RESEÑA 379');
INSERT INTO calificaciones VALUES (381, 3 , '1', '2022-05-19', 'RESEÑA 381');
INSERT INTO calificaciones VALUES (383, 4 , '5', '2022-05-20', 'RESEÑA 383');


INSERT INTO reservas VALUES (351, 2 , 'APROBADO', '2022-03-01', '2022-02-28', NULL, 351, 128, 10072 );
INSERT INTO reservas VALUES (352, 3 , 'PENDIENTE', '2022-03-08', '2022-03-06', NULL, 351, 116, 10057 );
INSERT INTO reservas VALUES (353, 4 , 'APROBADO', '2022-03-15', '2022-03-12', NULL, 351, 126, 10080 );
INSERT INTO reservas VALUES (354, 5 , 'PENDIENTE', '2022-03-22', '2022-03-18', NULL, 351, 122, 10053 );
INSERT INTO reservas VALUES (355, 6 , 'APROBADO', '2022-03-29', '2022-03-24', NULL, 351, 103, 10053 );
INSERT INTO reservas VALUES (356, 7 , 'PENDIENTE', '2022-04-05', '2022-03-30', NULL, 351, 108, 10085 );
INSERT INTO reservas VALUES (357, 8 , 'APROBADO', '2022-04-12', '2022-04-05', NULL, 351, 104, 10064 );
INSERT INTO reservas VALUES (358, 9 , 'PENDIENTE', '2022-04-19', '2022-04-11', NULL, 351, 102, 10071 );
INSERT INTO reservas VALUES (359, 10 , 'APROBADO', '2022-04-26', '2022-04-17', NULL, 351, 126, 10088 );
INSERT INTO reservas VALUES (360, 11 , 'PENDIENTE', '2022-05-03', '2022-04-23', NULL, 351, 108, 10060 );
INSERT INTO reservas VALUES (361, 12 , 'APROBADO', '2022-05-10', '2022-04-29', NULL, 351, 103, 10055 );
INSERT INTO reservas VALUES (362, 13 , 'PENDIENTE', '2022-05-17', '2022-05-05', NULL, 351, 128, 10051 );
INSERT INTO reservas VALUES (363, 14 , 'APROBADO', '2022-05-24', '2022-05-11', NULL, 351, 121, 10070 );
INSERT INTO reservas VALUES (364, 15 , 'PENDIENTE', '2022-05-31', '2022-05-17', NULL, 351, 101, 10051 );
INSERT INTO reservas VALUES (365, 1 , 'APROBADO', '2022-05-01', '2022-05-01', NULL, 351, 122, 10079 );
INSERT INTO reservas VALUES (366, 2 , 'PENDIENTE', '2022-05-08', '2022-05-07', NULL, 351, 117, 10072 );
INSERT INTO reservas VALUES (367, 3 , 'APROBADO', '2022-05-15', '2022-05-13', NULL, 351, 120, 10095 );
INSERT INTO reservas VALUES (368, 4 , 'PENDIENTE', '2022-05-22', '2022-05-19', NULL, 351, 119, 10067 );
INSERT INTO reservas VALUES (369, 5 , 'APROBADO', '2022-05-29', '2022-05-25', NULL, 351, 111, 10089 );
INSERT INTO reservas VALUES (370, 6 , 'PENDIENTE', '2022-06-05', '2022-05-31', NULL, 351, 118, 10078 );
INSERT INTO reservas VALUES (371, 7 , 'APROBADO', '2022-06-12', '2022-06-06', NULL, 351, 107, 10051 );
INSERT INTO reservas VALUES (372, 8 , 'PENDIENTE', '2022-06-19', '2022-06-12', NULL, 351, 111, 10099 );
INSERT INTO reservas VALUES (373, 9 , 'APROBADO', '2022-06-26', '2022-06-18', NULL, 351, 124, 10091);
INSERT INTO reservas VALUES (374, 10 , 'PENDIENTE', '2022-07-03', '2022-06-24', NULL, 351, 125, 10085 );
INSERT INTO reservas VALUES (375, 11 , 'APROBADO', '2022-07-10', '2022-06-30', NULL, 351, 117, 10054 );
INSERT INTO reservas VALUES (376, 12 , 'PENDIENTE', '2022-07-17', '2022-07-06', NULL, 351, 125, 10094 );
INSERT INTO reservas VALUES (377, 13 , 'APROBADO', '2022-07-24', '2022-07-12', NULL, 351, 106, 10063 );
INSERT INTO reservas VALUES (378, 14 , 'PENDIENTE', '2022-07-31', '2022-07-18', NULL, 351, 120, 10061 );
INSERT INTO reservas VALUES (379, 3 , 'APROBADO', '2022-07-03', '2022-07-01', NULL, 351, 124, 10097 );
INSERT INTO reservas VALUES (380, 3 , 'EJECUTADA', '2022-07-08', '2022-07-06', NULL, 351, 121, 10085 );
INSERT INTO reservas VALUES (381, 3 , 'APROBADO', '2022-07-13', '2022-07-11', NULL, 351, 109, 10079 );
INSERT INTO reservas VALUES (382, 3 , 'PENDIENTE', '2022-07-18', '2022-07-16', NULL, 351, 114, 10080 );
INSERT INTO reservas VALUES (383, 3 , 'APROBADO', '2022-07-23', '2022-07-21', NULL, 351, 113, 10074 );
INSERT INTO reservas VALUES (384, 3 , 'PENDIENTE', '2022-07-28', '2022-07-26', NULL, 351, 109, 10076 );

UPDATE reservas SET calificacion_id=id WHERE id%2=1;

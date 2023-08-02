use votaciones2557861;
delimiter //
create procedure InsertEleccion(in NewFechaE date, in NewanioE year, in newEstadoE boolean)

begin

Insert into eleccion (fechaEleccion,anioEleccion,estadoEL)
values (NewFechaE, NewanioE, newEstadoE);

End;
//
call InsertEleccion('2002-05-26','2002',True);

select * from eleccion;

/*Actualizar la fecha de una elección
/drop procedure UpdateEstadoE*/
 delimiter //
create procedure UpdateFechaE(in idE int, in NewFechaE date)

begin

Update eleccion 
set fechaEleccion = NewFechaE
where idEleccion = idE;

End;
//
call UpdateFechaE(5,'2017-04-12');

select * from eleccion;

/*Cambiar de estado una elección*/

 delimiter //
create procedure UpdateEstadoE(in idE int, in newEstadoE Boolean)

begin

Update eleccion 
set estadoEL = newEstadoE
where idEleccion = idE;

End;
//
call UpdateEstadoE(5,false);

select * from eleccion;

/*Consultar usuario (con llaves foráneas)*/

 delimiter //
create procedure ConsultaU(in idU int)

begin

Select nomtipdoc,noDocumento,nombreUsuario,apellidoUsuario,nomGenero,fechaNacUsuario,emailUsuario,passwordUsuario,nomJornada,nomTipoMiembro,nomCurso
From usuario inner join tipodocumento
on tipodocumento.idTipoDoc = Usuario.idtipodocFK inner join jornada
on jornada.idjornada = usuario.idjornadafk inner join genero 
on genero.idgenero = usuario.idgenerofk inner join tipomiembro
on tipomiembro.idtipomiembro = usuario.idtipomiembrofk inner join curso
on curso.idcurso = usuario.idcurso
where idUsuario= idU;

End;
//
call ConsultaU(5);



drop procedure ChangePassword
/*Cambiar Password*/
delimiter //
create procedure ChangePassword(in idU int, in Newpassword varchar(20))

begin

Update usuario 
set passwordUsuario = Newpassword
where idUsuario = idU;

End;
//
call ChangePassword(5,'Jonas3454');

select * from usuario;

/*Cambiar Estado Usuario*/
 delimiter //
create procedure UpdateEstadoU(in idU int, in newEstadoU Boolean)

begin

Update usuario
set estadoU = newEstadoU
where idUsuario = idU;

End;
//
call UpdateEstadoU(6,false);

select * from usuario;

/*Consultar usuario (con llaves foráneas) que tengan cédula de ciudadanía*/
drop procedure ConsultaUT
delimiter //
create procedure ConsultaUT(in TipoDocU int)

begin

Select noDocUsuario,idTipoDocfk,nombreUsuario,apellidoUsuario,nomGenero,fechaNacUsuario,emailUsuario,passwordUsuario,nomJornada,nomTipoMiembro,nomCurso
From usuario inner join tipodocumento
on tipodocumento.idTipoDoc = Usuario.idtipodocFK inner join jornada
on jornada.idjornada = usuario.idjornadafk inner join genero 
on genero.idgenero = usuario.idgenerofk inner join tipomiembro
on tipomiembro.idtipomiembro = usuario.idtipomiembrofk inner join curso
on curso.idcurso = usuario.idcursoFK
where idTipoDocFK= TipoDocU;

End;
//

call ConsultaUT(2);

select * from usuario;

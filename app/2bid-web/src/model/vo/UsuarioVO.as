package model.vo
{
	import mx.controls.Alert;
	
	[Bindable]
	[RemoteClass(alias="model.Usuario")]
	public class UsuarioVO
	{
	 public var id_usuario:int;
	 public var nombre:String;
	 public var email:String;
	 public var nick:String;
	 public var password:String;
	 public var tipo:String;
	 public var nro_tarjeta:String;
	 public var fecha_alta:Date;
	 public var fecha_modificacion:Date;
	 
	 public function equal(u:UsuarioVO):Boolean {
	 		return this.id_usuario==u.id_usuario;
			
	 }
		public function UsuarioVO()
		{
		}

	}
}
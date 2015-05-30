package events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import model.vo.UsuarioVO;

	public class InsertarUsuarioEvent extends CairngormEvent
	{   static public var EVENT_NAME: String = "InsertarUsuarioEvent";
		public var usuario:UsuarioVO;
		
		public function InsertarUsuarioEvent(usuario:UsuarioVO)
		{
			super(EVENT_NAME);
			this.usuario=usuario;
		}
		
	}
}
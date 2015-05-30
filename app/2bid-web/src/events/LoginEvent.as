package events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import model.vo.UsuarioVO;

	public class LoginEvent extends CairngormEvent{   
		static public var EVENT_NAME: String = "LoginEvent";
		public var usuario:UsuarioVO;	
		
		public function LoginEvent(usuario:UsuarioVO)
		{
			super(EVENT_NAME);
			this.usuario=usuario;
		}
		
	}
}
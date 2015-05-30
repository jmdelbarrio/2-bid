package model.business
{
	import com.adobe.cairngorm.business.Responder;	
	import model.business.AbstractBussinesDelegate;	
	import model.vo.UsuarioVO;	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;	
	import mx.controls.Alert;
	
	public class EnterpriseBusinessDelegate extends AbstractBussinesDelegate {
		private var responder: Responder;

		public function EnterpriseBusinessDelegate(iresponder:Responder){
			super();
			responder = iresponder; //es el command
		}
	
		public function insertarUsuario(usuario:UsuarioVO):void{
			var ro: RemoteObject = this.getRemoteObject("usuarioDAO");
	      	var token : AsyncToken = ro.insert(usuario);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		} 
		
		public function login(usuario:UsuarioVO):void{
			var ro: RemoteObject = this.getRemoteObject("usuarioDAO");
	      	var token : AsyncToken = ro.getUsuario(usuario.nick, usuario.password);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;			
		} 
	}
}
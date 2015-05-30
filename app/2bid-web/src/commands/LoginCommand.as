package commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import model.business.EnterpriseBusinessDelegate;
	import events.LoginEvent;
	import model.business.EnterpriseModelLocator;
	import model.vo.UsuarioVO;
	import mx.messaging.messages.ErrorMessage
	
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;
	
	public class LoginCommand implements Responder, Command{	
		private var modelo:EnterpriseModelLocator=EnterpriseModelLocator.Instance;
		public function onResult(event:*=null):void{
			modelo.login=1;
			var resultEvent: ResultEvent = event as ResultEvent;
			var c:UsuarioVO = resultEvent.result as UsuarioVO;
			modelo.user = c; 
        	/*Muestro menu de usuario logueado. Discrimino por usuario comun o admin*/
        	if (c.tipo == 'A') modelo.menu = modelo.menuAdmin;
        	else modelo.menu = modelo.menuLogin;   											
		}
		
		public function onFault(event:*=null):void
		{
			var errorMessage:ErrorMessage = event.message as ErrorMessage;
			Alert.show(errorMessage.rootCause.message);		
			modelo.login=0;

		}
		
		public function execute(event:CairngormEvent):void
		{
			 var loginEvent:LoginEvent=LoginEvent(event);		 
		     var enterpriseBusinessDelegate: EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     modelo.login=0;
		     enterpriseBusinessDelegate.login(loginEvent.usuario);
		     
		} 
		
	}
}
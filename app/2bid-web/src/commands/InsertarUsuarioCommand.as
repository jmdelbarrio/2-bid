package commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import model.business.EnterpriseBusinessDelegate;
	import events.InsertarUsuarioEvent;
	import model.business.EnterpriseModelLocator;
	import model.vo.UsuarioVO;
	import mx.messaging.messages.ErrorMessage
	
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;

	public class InsertarUsuarioCommand implements Responder, Command
	{
		private var modelo:EnterpriseModelLocator=EnterpriseModelLocator.Instance;
		
		public function onResult(event:*=null):void
		{
			modelo.insertarUsuarioOk=1;
			var resultEvent: ResultEvent = event as ResultEvent;
			var c:UsuarioVO = resultEvent.result as UsuarioVO;
			modelo.ultimoUsuarioInsertado= c;
			Alert.show("Usuario insertado correctamente");
			
			
		}
		
		public function onFault(event:*=null):void
		{
			
			var errorMessage:ErrorMessage = event.message as ErrorMessage;
			Alert.show(errorMessage.rootCause.message);
			
			modelo.insertarUsuarioOk=0;
		}
		
		public function execute(event:CairngormEvent):void
		{
			var insertarUsuarioEvent:InsertarUsuarioEvent=InsertarUsuarioEvent(event);		 
		     var enterpriseBusinessDelegate: EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     modelo.insertarUsuarioOk=0;
		     enterpriseBusinessDelegate.insertarUsuario(insertarUsuarioEvent.usuario);
		} 
		
	}
}
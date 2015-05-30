package control
{
	import com.adobe.cairngorm.control.FrontController;
	
	import commands.InsertarUsuarioCommand;
	import commands.LoginCommand;
	import events.*; 
	
	public class TwoBidControl extends FrontController
	{
		public function TwoBidControl()		{
			
			addCommand(InsertarUsuarioEvent.EVENT_NAME,InsertarUsuarioCommand);
			addCommand(LoginEvent.EVENT_NAME,LoginCommand);
		}

	}
}
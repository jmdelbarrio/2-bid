package model.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import mx.rpc.remoting.RemoteObject;
	
	public class AbstractBussinesDelegate
	{
		public function AbstractBussinesDelegate()
		{
		}

		public function getRemoteObject(objectName:String):RemoteObject {
			return ServiceLocator.getInstance().getRemoteObject(objectName);
		}
	}
}
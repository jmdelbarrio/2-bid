package model.business
{
	 import com.adobe.cairngorm.model.IModelLocator;	 
	 import model.vo.UsuarioVO;
	 import mx.collections.ArrayCollection;
	 import mx.controls.Menu;
  
  
  [Bindable]
  public class EnterpriseModelLocator implements IModelLocator
  {
    static private var _instance: EnterpriseModelLocator = new EnterpriseModelLocator();
	public var catalogos : ArrayCollection = new ArrayCollection();	
	public var catalogosRemitos: ArrayCollection = new ArrayCollection();
	public var clientes: ArrayCollection = new ArrayCollection();
	public var editoriales: ArrayCollection = new ArrayCollection();
	public var pedidos: ArrayCollection = new ArrayCollection();
	public var pedidosConsulta: ArrayCollection = new ArrayCollection();
	public var librosPedidos: ArrayCollection = new ArrayCollection();
	public var remitosConsulta: ArrayCollection = new ArrayCollection();
	public var pedidosDistribuidorasConsulta: ArrayCollection = new ArrayCollection();
	public var itemsPedidosADistribuidoras:ArrayCollection=new ArrayCollection();
	public var ultimoUsuarioInsertado:UsuarioVO;
	    
    public var insertarUsuarioOk:int;
    public var login:int;
    public var user:UsuarioVO;
    public var menuAdmin:ArrayCollection;
	public var menuLogin:ArrayCollection;
	public var menuLogout:ArrayCollection;
	public var menu:ArrayCollection;	

    public function EnterpriseModelLocator()
    {
      if(_instance != null)
        throw new Error("Error: No instanciar singleton");
    }
    
    static public function get Instance(): EnterpriseModelLocator
    {
      return _instance;
    }
    
    public function hayUsuarioAdminLogueado():Boolean
    {
    if (user==null) return false;
    return (user.tipo=="A");
    }
           
	    

  }
}
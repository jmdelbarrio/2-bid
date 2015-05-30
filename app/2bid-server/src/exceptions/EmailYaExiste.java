package exceptions;

public class EmailYaExiste extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public EmailYaExiste(String msg) {
        super(msg);
    }

}

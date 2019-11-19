package service;

import com.sun.corba.se.spi.orbutil.fsm.Action;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();
	
	private ActionFactory() {
		super();
	}
	
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		System.out.println("ActionFactory:" + command);
		
		if(command.equals("prd_detail")) {
			action = (Action) new PrdDetailAction();
		}
		return action;
	}
}

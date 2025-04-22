package AeroBook;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Users {
	static HashMap<String,Users> map = new HashMap<>();
    private String username;
    private String password;
    List<Flights> ticket= new ArrayList<>();

    public Users(String username, String password) {
        this.username = username;
        this.password = password;
        map.put(username,this);
        
    }
    public void addTicket(Flights f)
    {
    	ticket.add(f);
    }
    
    public List<Flights> getTickets() {return this.ticket;}
  
    
    
    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
    

}

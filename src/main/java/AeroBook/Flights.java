package AeroBook;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Flights {
    private String date;
    private double price;
    private String fromCity;
    private String toCity;

    private static Map<String, List<Flights>> routeMap = new HashMap<>();

    static {
        new Flights("Delhi", "Mumbai", "2025-05-01", 3500.00);
        new Flights("Delhi", "Mumbai", "2025-05-01", 3700.00); // sample extra flight
        new Flights("Mumbai", "Bengaluru", "2025-05-02", 2500.00);
        new Flights("Bengaluru", "Chennai", "2025-05-03", 2200.00);
        new Flights("Chennai", "Kolkata", "2025-05-04", 1500.00);
        new Flights("Kolkata", "Delhi", "2025-05-05", 3000.00);
        new Flights("Delhi", "Hyderabad", "2025-05-06", 2800.00);
        new Flights("Hyderabad", "Pune", "2025-05-07", 2600.00);
        new Flights("Pune", "Goa", "2025-05-08", 1800.00);
    }

    public Flights(String fromCity, String toCity, String date, double price) {
        this.fromCity = fromCity;
        this.toCity = toCity;
        this.date = date;
        this.price = price;

        String routeKey = fromCity + "-" + toCity;
        routeMap.putIfAbsent(routeKey, new ArrayList<>());
        routeMap.get(routeKey).add(this);
    }

    // Getter methods
    public String getDate() { return date; }
    public double getPrice() { return price; }
    public String getFromCity() { return fromCity; }
    public String getToCity() { return toCity; }

    // Search method
    public static List<Flights> search(String from, String to, String date, double low, double high) {
        List<Flights> result = new ArrayList<>();
        String key = from + "-" + to;

        if (routeMap.containsKey(key)) {
            for (Flights f : routeMap.get(key)) {
                boolean isInPriceRange = (f.price >= low && f.price <= high);
                boolean isMatchingDate = (date == null || f.date.equals(date));

                if (isMatchingDate && isInPriceRange) {
                    result.add(f);
                }
            }
        }
        return result;
    }
}

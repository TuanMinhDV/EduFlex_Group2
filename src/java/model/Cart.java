
package model;

import java.util.ArrayList;
import java.util.List;


public class Cart {
    private List<CartItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<CartItem> items) {
        this.items = items;
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }
    private CartItem getItemsBySubjectId(int subject_id){
        for (CartItem i : items) {
            if(i.getOrderCourse().getCourse_id()==subject_id)
                return i;
        }
        return null;
        
    }
    public void addItem(CartItem t){
        if(getItemsBySubjectId(t.getOrderCourse().getCourse_id())!=null){
            CartItem m =getItemsBySubjectId(t.getOrderCourse().getCourse_id());
        }else{
            items.add(t);
        }
    }
    public void removeItem(int subject_id){
        if(getItemsBySubjectId(subject_id)!=null){
            items.remove(getItemsBySubjectId(subject_id));
        }
    }
    public double getTotalMoney(){
        double t = 0;
        for (CartItem i : items) {
            t+=i.getPrice();
        }
            return t;  
    }
     public void clearCart() {
        items.clear();
    }
 

//    public static void main(String[] args) {
//        Cart cart = new Cart();
//        Item i = new Item(new OrderSubject(1, "", "", 0.0), 0);
//        Item i2 = new Item(new OrderSubject(2, "", "", 0.0), 0);
//        cart.addItem(i);
//        cart.addItem(i2);
//        for (Item item : cart.items) {
//            System.out.println(item.getOrderSubject().getSubject_id());
//            
//        }
//        cart.removeItem(1);
//        for (Item item : cart.items) {
//            System.out.println(item.getOrderSubject().getSubject_id());
//            
//        }
//    }
}
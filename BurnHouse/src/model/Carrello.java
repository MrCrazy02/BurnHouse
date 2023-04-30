package model;
import java.util.ArrayList;
import model.*;

public class Carrello {
 private ArrayList<CartProduct> cart;


public Carrello()
{
	cart=new ArrayList<CartProduct>();
}
	
	public void AddtoCart(ProductBean prod)
	{
		CartProduct order=new CartProduct();
		order.SetCode(prod.getCode());
		order.SetNome(prod.getName());
		order.SetPrezzo(prod.getPrice());
		order.SetQuantita(1);
		
		if(cart.contains(order))
		{
			cart.remove(order);
			order.IncrQuantita();
			cart.add(order);
		}
		else 
		{
		cart.add(order);
		}
	}
	
	public void RemovetoCart(int id)
	{
		for(CartProduct c: cart)
		{
			if(c.GetCode()==id) 
			{
			cart.remove(c);
			break; cart.get
			}
		}
	}
	public ArrayList<CartProduct> GetCart()
	{
		return this.cart;
	}
}

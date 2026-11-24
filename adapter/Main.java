package adapter;

public class Main {
    public static void main(String[] args) {
        System.out.println("--- Adapter Pattern Demo ---");
        
        PaymentProcessor payPal = new PayPalAdapter(new PayPalService());
        payPal.pay(100);

        PaymentProcessor phonePe = new PhonePeAdapter(new PhonePeService());
        phonePe.pay(250);
    }
}

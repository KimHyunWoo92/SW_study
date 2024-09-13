package Question5;

public class Main {

	public static void main(String[] args) {
		
		goBusan(new Train());
		goBusan(new Bus());
		goBusan(new Airplane());
	}

	private static void goBusan(Ride b) {
		b.go();
	}
}

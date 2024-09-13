package ex02_switchcase;

import java.util.Scanner;

public class ex01_switchcase {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("점수 입력 : ");
		int totalScore = sc.nextInt();
		/*
		switch (totalScore) {
		case 100,99,98,97,96,95,94,93,92,91,90:
			System.out.println("A학점");
			break;
		case 89,88,87,86,85,84,83,82,81,80:
			System.out.println("B학점");
			break;
		case 79,78,77,76,75,74,73,72,71,70:
			System.out.println("C학점");
			break;
		default :
			System.out.println("D학점");
			break;
		}
		*/
		switch (totalScore/10) {
		case 10:
		case 9:
			System.out.println("A학점");
			break;
		case 8:
			System.out.println("B학점");
			break;
		case 7:
			System.out.println("C학점");
			break;
		default:
			System.out.println("D학점");
			break;
		}
		sc.close();

	}

}

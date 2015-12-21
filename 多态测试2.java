package package0;


	/*
	对象的多态性：动物 x = new 猫();
	函数的多态性：函数重载、重写

	1、多态的体现
			父类的引用指向了自己的子类对象
			父类的引用也可以接收自己的对象
	2、多态的前提
			必须是类与类之间只有关系，要么继承或实现
			通常还有一个前提，存在覆盖
	3、多态的好处
			多态的出现大大的提高了程序的扩展性
	4、多态的弊端
			只能使用父类的引用访问父类的成员
	5、多态的应用

	6、注意事项
	*/

	/*
	需求：
	猫，狗。
	*/

	abstract class Animal
	{
		abstract void eat();//抽象方法要被子类实现
	}

	class Cat extends Animal
	{
		public void eat()
		{
			System.out.println("吃鱼");
		}
		public void catchMouse()
		{
			System.out.println("抓老鼠");
		}
	}

	class Dog extends Animal
	{
		public void eat()
		{
			System.out.println("吃骨头");
		}
		public void kanJia()
		{
			System.out.println("看家");
		}
	}

	public class 多态测试2
	{
		public static void main(String[] args)
		{
			function(new Cat());//这里没有用到多态，只是调用对象本身的方法；
			function(new Dog());
			
			Animal a = new Cat();//向上转型，一定是父类对象的引用才行
			a.eat();
			
			Cat c = (Cat)a;//向下转型，类型转换
			c.catchMouse();
		}
		
		public static void function(Animal a)
		{
			a.eat();
			//用于子类型有限
			//或判断所属类型进而使用其特有方法
			if(a instanceof Cat)
			{
				Cat c = (Cat)a;
				c.catchMouse();
			}
			else if(a instanceof Dog)
			{
				Dog c = (Dog)a;
				c.kanJia();
			}
		}
		
		
	}	

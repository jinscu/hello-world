package package0;


	/*
	����Ķ�̬�ԣ����� x = new è();
	�����Ķ�̬�ԣ��������ء���д

	1����̬������
			���������ָ�����Լ����������
			���������Ҳ���Խ����Լ��Ķ���
	2����̬��ǰ��
			������������֮��ֻ�й�ϵ��Ҫô�̳л�ʵ��
			ͨ������һ��ǰ�ᣬ���ڸ���
	3����̬�ĺô�
			��̬�ĳ��ִ�������˳������չ��
	4����̬�ı׶�
			ֻ��ʹ�ø�������÷��ʸ���ĳ�Ա
	5����̬��Ӧ��

	6��ע������
	*/

	/*
	����
	è������
	*/

	abstract class Animal
	{
		abstract void eat();//���󷽷�Ҫ������ʵ��
	}

	class Cat extends Animal
	{
		public void eat()
		{
			System.out.println("����");
		}
		public void catchMouse()
		{
			System.out.println("ץ����");
		}
	}

	class Dog extends Animal
	{
		public void eat()
		{
			System.out.println("�Թ�ͷ");
		}
		public void kanJia()
		{
			System.out.println("����");
		}
	}

	public class ��̬����2
	{
		public static void main(String[] args)
		{
			function(new Cat());//����û���õ���̬��ֻ�ǵ��ö�����ķ�����
			function(new Dog());
			
			Animal a = new Cat();//����ת�ͣ�һ���Ǹ����������ò���
			a.eat();
			
			Cat c = (Cat)a;//����ת�ͣ�����ת��
			c.catchMouse();
		}
		
		public static void function(Animal a)
		{
			a.eat();
			//��������������
			//���ж��������ͽ���ʹ�������з���
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

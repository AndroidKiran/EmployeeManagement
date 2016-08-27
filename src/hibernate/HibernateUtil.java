package hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;



public class HibernateUtil {
	public final static SessionFactory s_factory;
	static
	{
		try
		{
			//s_factory=new Configuration().configure().buildSessionFactory();
			Configuration config=new Configuration();
			s_factory=config.configure().buildSessionFactory();
			System.out.println("sesssion.... "+s_factory);
		}
		catch(Exception e)
		{
			System.out.println("error In HibernateUtil Class : "+e);
			throw new ExceptionInInitializerError(e);
		}
			
  }
	public static Session getsession()
	{
		Session session=s_factory.openSession();
		return session;
		
	}
}



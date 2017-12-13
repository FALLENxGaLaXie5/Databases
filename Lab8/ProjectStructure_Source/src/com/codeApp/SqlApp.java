/**
 * Joshua Steward
 * Comp 420 Databases
 * Lab8 Application for Interacting with aviationco
 */



package com.codeApp;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class SqlApp {
    private JButton queryButton;
    private JPanel panelMain;
    private JButton writeButton;
    private JLabel TitleLabel;
    private JButton Update;
    private JButton deleteButton;

    public SqlApp() {
        queryButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e)
            {
                JFrame frame2 = new JFrame("Query");
                frame2.setVisible(true);
                frame2.setSize(600, 600);
                JLabel label = new JLabel("Enter Your Query:");
                JTextField jt = new JTextField("select concat(EMP_FNAME, ' ', EMP_LNAME)\n as 'Employee Name' from employee;", 100);
                JLabel idLabel = new JLabel("Enter Your ID for your database:");
                JTextField idText = new JTextField("root");
                JLabel pwLabel = new JLabel("Enter Your PW for your database:");
                JTextField pwText = new JTextField("Cronosphere1");
                JTextField connectText = new JTextField("jdbc:mysql://localhost:3306/aviationco?autoReconnect=true&useSSL=false");
                JTextArea label2 = new JTextArea("");
                JPanel panel = new JPanel();
                frame2.add(panel);
                panel.add(label);
                panel.add(jt);
                panel.add(idLabel);
                panel.add(idText);
                panel.add(pwLabel);
                panel.add(pwText);
                panel.add(connectText);
                panel.add(label2);

                jt.addActionListener(new ActionListener()
                {
                    @Override
                    public void actionPerformed(ActionEvent e)
                    {
                        String inputQuery = jt.getText();
                        String id = idText.getText();
                        String pw = pwText.getText();
                        String url = connectText.getText();
                        label2.setText(getQuery(inputQuery, id, pw, url));
                    }
                });

                //JOptionPane.showMessageDialog(null, "Hello World");
            }
        });
        writeButton.addActionListener(new ActionListener()
        {
            @Override
            public void actionPerformed(ActionEvent e)
            {
                JFrame frame2 = new JFrame("Write");
                frame2.setVisible(true);
                frame2.setSize(600, 600);
                JLabel label = new JLabel("Enter Your Insert Statement:");
                JTextField jt = new JTextField("insert into `charter` values (10026, '2017-09-22 00:00:00', '1484P', 'TYS', 700, 4, 5.2, 141, 1, 10020);", 100);
                JLabel idLabel = new JLabel("Enter Your ID for your database:");
                JTextField idText = new JTextField("root");
                JLabel pwLabel = new JLabel("Enter Your PW for your database:");
                JTextField pwText = new JTextField("Cronosphere1");
                JTextField connectText = new JTextField("jdbc:mysql://localhost:3306/aviationco?autoReconnect=true&useSSL=false");
                JTextArea label2 = new JTextArea("");
                JPanel panel = new JPanel();
                frame2.add(panel);
                panel.add(label);
                panel.add(jt);
                panel.add(idLabel);
                panel.add(idText);
                panel.add(pwLabel);
                panel.add(pwText);
                panel.add(connectText);
                panel.add(label2);

                jt.addActionListener(new ActionListener()
                {
                    @Override
                    public void actionPerformed(ActionEvent e)
                    {
                        String input = jt.getText();
                        String id = idText.getText();
                        String pw = pwText.getText();
                        String url = connectText.getText();
                        label2.setText(getInsert(input, id, pw, url));
                    }
                });
            }
        });
        Update.addActionListener(new ActionListener()
        {
            @Override
            public void actionPerformed(ActionEvent e)
            {
                JFrame frame2 = new JFrame("Write");
                frame2.setVisible(true);
                frame2.setSize(600, 600);
                JLabel label = new JLabel("Enter Your Insert Statement:");
                JTextField jt = new JTextField("update employee set EMP_INITIAL='A' where EMP_NUM between 101 and 104;", 100);
                JLabel idLabel = new JLabel("Enter Your ID for your database:");
                JTextField idText = new JTextField("root");
                JLabel pwLabel = new JLabel("Enter Your PW for your database:");
                JTextField pwText = new JTextField("Cronosphere1");
                JTextField connectText = new JTextField("jdbc:mysql://localhost:3306/aviationco?autoReconnect=true&useSSL=false");
                JTextArea label2 = new JTextArea("");
                JPanel panel = new JPanel();
                frame2.add(panel);
                panel.add(label);
                panel.add(jt);
                panel.add(idLabel);
                panel.add(idText);
                panel.add(pwLabel);
                panel.add(pwText);
                panel.add(connectText);
                panel.add(label2);
                jt.addActionListener(new ActionListener()
                {
                    @Override
                    public void actionPerformed(ActionEvent e)
                    {
                        String input = jt.getText();
                        String id = idText.getText();
                        String pw = pwText.getText();
                        String url = connectText.getText();
                        label2.setText(getUpdate(input, id, pw, url));
                    }
                });
            }
        });
        deleteButton.addActionListener(new ActionListener()
        {
            @Override
            public void actionPerformed(ActionEvent e)
            {
                JFrame frame2 = new JFrame("Write");
                frame2.setVisible(true);
                frame2.setSize(600, 600);
                JLabel label = new JLabel("Enter Your Insert Statement:");
                JTextField jt = new JTextField("delete from employee where EMP_NUM < 101;", 100);
                JLabel idLabel = new JLabel("Enter Your ID for your database:");
                JTextField idText = new JTextField("root");
                JLabel pwLabel = new JLabel("Enter Your PW for your database:");
                JTextField pwText = new JTextField("Cronosphere1");
                JTextField connectText = new JTextField("jdbc:mysql://localhost:3306/aviationco?autoReconnect=true&useSSL=false");
                JTextArea label2 = new JTextArea("");
                JPanel panel = new JPanel();
                frame2.add(panel);
                panel.add(label);
                panel.add(jt);
                panel.add(idLabel);
                panel.add(idText);
                panel.add(pwLabel);
                panel.add(pwText);
                panel.add(connectText);
                panel.add(label2);
                jt.addActionListener(new ActionListener()
                {
                    @Override
                    public void actionPerformed(ActionEvent e)
                    {
                        String input = jt.getText();
                        String id = idText.getText();
                        String pw = pwText.getText();
                        String url = connectText.getText();
                        label2.setText(getDelete(input, id, pw, url));
                    }
                });
            }
        });
    }


    String getQuery(String inputQuery, String id, String pw, String url)
    {
        Connection con = null;
        String newOutput = "\n";
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            //String uid = "root";
            //String pwd = "Cronosphere1";
            con = DriverManager.getConnection(url, id, pw);
            if (!con.isClosed())
            {
                System.out.println("Connected to MySQL Server.");
            }
            Statement statement = null;
            statement = con.createStatement();

            ResultSet resultSet = statement.executeQuery(inputQuery);
            ResultSetMetaData meta = resultSet.getMetaData();
            int numCols = meta.getColumnCount();

            while (resultSet.next())
            {
                for (int i = 1; i <= numCols; i++)
                {
                    newOutput = newOutput + resultSet.getString(i) + "\n";
                }
            }
        }
        catch (Exception e)
        {
            System.err.println("Exception: " + e.getMessage());
        }
        finally
        {
            try
            {
                if (con != null)
                {
                    con.close();
                    System.out.println("Disconnected from MySQL server.");
                }
            }
            catch (SQLException e)
            {
                System.err.println("Exception: " + e.getMessage());
            }
        }
        return newOutput;
    }


    String getInsert(String insertStatement, String id, String pw, String url)
    {
        Connection con = null;
        String newOutput = "\n";
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, id, pw);
            if (!con.isClosed())
            {
                System.out.println("Connected to MySQL Server.");
            }
            Statement statement = null;
            statement = con.createStatement();
            statement.executeUpdate(insertStatement);
            newOutput = newOutput + "Shweet, Success";
        }
        catch (Exception e)
        {
            System.err.println("Exception: " + e.getMessage());
            newOutput = newOutput + "Connection Failed";
        }
        finally
        {
            try
            {
                if (con != null)
                {
                    con.close();
                    System.out.println("Disconnected from MySQL server.");
                }
            }
            catch (SQLException e)
            {
                System.err.println("Exception: " + e.getMessage());
            }
        }
        return newOutput;
    }



    String getUpdate(String insertStatement, String id, String pw, String url)
    {
        Connection con = null;
        String newOutput = "\n";
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, id, pw);
            if (!con.isClosed())
            {
                System.out.println("Connected to MySQL Server.");
            }
            Statement statement = null;
            statement = con.createStatement();
            statement.executeUpdate(insertStatement);
            newOutput = newOutput + "Shweet, Connection Success";
        }
        catch (Exception e)
        {
            System.err.println("Exception: " + e.getMessage());
            newOutput = newOutput + "Not so shweet, Connection failed";
        }
        finally
        {
            try
            {
                if (con != null)
                {
                    con.close();
                    System.out.println("Disconnected from MySQL server.");
                }
            }
            catch (SQLException e)
            {
                System.err.println("Exception: " + e.getMessage());
            }
        }
        return newOutput;
    }


    String getDelete(String deleteStatement, String id, String pw, String url)
    {
        Connection con = null;
        String newOutput = "\n";
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, id, pw);
            if (!con.isClosed())
            {
                System.out.println("Connected to MySQL Server.");
            }
            Statement statement = null;
            statement = con.createStatement();
            int affected = statement.executeUpdate(deleteStatement);
            newOutput = newOutput + "Rows That Were Affected: " + affected;
        }
        catch (Exception e)
        {
            System.err.println("Exception: " + e.getMessage());
            newOutput = newOutput + "Connection Failed";
        }
        finally
        {
            try
            {
                if (con != null)
                {
                    con.close();
                    System.out.println("Disconnected from MySQL server.");
                }
            }
            catch (SQLException e)
            {
                System.err.println("Exception: " + e.getMessage());
            }
        }
        return newOutput;
    }

    public static void main(String[] args) throws FileNotFoundException
    {
        JFrame frame = new JFrame("SqlApp");
        frame.setContentPane(new SqlApp().panelMain);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(300, 300);
        frame.pack();
        frame.setVisible(true);

    }
}

# Chanda Furniture

Ecommerce website for furniture trading.
Website hosted at [openshift](https://chanda-furniture.7e14.starter-us-west-2.openshiftapps.com/)


# Features

- Jsp and servlets
- Apache Tomcat v8.5
- jdk-8
- MySQL database
- Connection pool


## Run locally

- Recreate database using provided `.sql` file in sql folder under database name furniture
> Sql file - [https://raw.githubusercontent.com/Klaus-poppe/Chanda/master/SQL/furniture.sql](https://raw.githubusercontent.com/Klaus-poppe/Chanda/master/SQL/furniture.sql)

- Clone project

- Open as maven project in eclipse or any java IDE

- Build the project using maven

- Add context.xml in META-INF folder with resource name jdbc/conPool
Providing driver, username, password and url for database connection eg.
 ```
 <Context>
<Resource name="jdbc/conPool"
auth="Container"
type="javax.sql.DataSource"
maxActive="5"
maxIdle="2"
maxWait="-1"
username="root"
password=""
driverClassName="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/furniture">
</Resource>
</Context>
```
- Run it on tomcat server and open `localhost:8080/Chanda-Furniture/home`

## Authors

> **Ashwin Jawahar** - *ashwinj.vontivillu@st.niituniversity.in*

## License and privacy policy

> This project is licensed under the MIT License

> You can find our privacy policy [here](https://www.privacypolicygenerator.info/live.php?token=NlGHx0DaeEorOXZAw3KuVz1m9EZ39yph)

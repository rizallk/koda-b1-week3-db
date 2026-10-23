# Database E-Wallet (Week 3)

## ERD E-Wallet
### Screenshot ERD
<p align="center">
<img src="image.png" width="550">
</p>

<hr/>

### ERD (live mermaid)
```mermaid
erDiagram
  USERS {
    int id PK
    string fullname
    string username
    string email
    int phone
    string photo
    int pin
    int balance
    date created_at
    date updated_at
  }
  AUDIT_LOG {
    int id PK
    int user_id FK
    date login_at
    date logout_at
  }
  TRANSACTIONS {
    int id PK
    int user_id FK
    int category_id FK
    string transaction_number
    int amount
    enum type "income | expense"
    string receiver
    string description
    date transaction_date
  }
  CATEGORIES {
    int id PK
    string name
    date created_at
    date updated_at
  }

  USERS || -- o{ TRANSACTIONS : memiliki
  TRANSACTIONS }| -- || CATEGORIES : memiliki
  USERS || -- |{ AUDIT_LOG : memiliki
```

## Urutan Eksekusi File Query SQL
1. DDL.sql
2. login.sql
3. register.sql
4. get_user_login_info.sql
5. get_check_user_pin.sql
6. get_transaction_history.sql
7. get_user_history.sql
8. get_user_account.sql
9. find_reciver.sql
10. create_transaction.sql
11. get_user_profile.sql
12. change_pin.sql
13. change_password.sql
14. change_user_profile.sql

<hr/>

### Keterangan
- Pastikan database-nya sudah dibuat terlebih dahulu
- Pastikan eksekusi file query-nya harus berurutan, dimulai dari DDL.sql (Data Defition Language), dst.
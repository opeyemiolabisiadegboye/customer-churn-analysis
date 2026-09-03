CREATE TABLE customer_churn (
    row_number            INTEGER,
    customer_id           BIGINT PRIMARY KEY,
    surname               VARCHAR(100),
    credit_score          INTEGER,
    geography             VARCHAR(50),
    gender                VARCHAR(20),
    age                   INTEGER,
    tenure                INTEGER,
    balance               NUMERIC(18,2),
    num_of_products       INTEGER,
    has_cr_card           BOOLEAN,
    is_active_member      BOOLEAN,
    estimated_salary      NUMERIC(18,2),
    exited                BOOLEAN,
    complain              BOOLEAN,
    satisfaction_score    INTEGER,
    card_type             VARCHAR(50),
    point_earned          INTEGER
);

SELECT * FROM customer_churn;
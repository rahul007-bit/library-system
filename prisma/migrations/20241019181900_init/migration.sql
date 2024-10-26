-- CreateTable
CREATE TABLE "Book" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "author" TEXT NOT NULL,
    "average_rating" DOUBLE PRECISION,
    "isbn" TEXT NOT NULL,
    "isbn13" TEXT NOT NULL,
    "language_code" TEXT NOT NULL,
    "num_pages" INTEGER NOT NULL,
    "ratings_count" INTEGER NOT NULL,
    "text_reviews_count" INTEGER NOT NULL,
    "publication_date" TIMESTAMP(3) NOT NULL,
    "publisher" TEXT NOT NULL,
    "total_quantity" INTEGER NOT NULL,
    "available_quantity" INTEGER NOT NULL,
    "rented_count" INTEGER NOT NULL,

    CONSTRAINT "Book_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Member" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "registered_on" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "outstanding_debt" DOUBLE PRECISION NOT NULL,
    "amount_spent" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Member_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Transaction" (
    "id" SERIAL NOT NULL,
    "book_id" INTEGER NOT NULL,
    "member_id" INTEGER NOT NULL,
    "per_day_fee" DOUBLE PRECISION NOT NULL,
    "borrowed_on" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "returned_on" TIMESTAMP(3),
    "total_charge" DOUBLE PRECISION,
    "amount_paid" DOUBLE PRECISION,

    CONSTRAINT "Transaction_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Book_isbn_key" ON "Book"("isbn");

-- CreateIndex
CREATE UNIQUE INDEX "Book_isbn13_key" ON "Book"("isbn13");

-- CreateIndex
CREATE UNIQUE INDEX "Member_email_key" ON "Member"("email");

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "Book"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "Member"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

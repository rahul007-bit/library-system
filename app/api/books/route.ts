import prisma from "@/lib/prisma";
import { NextResponse } from "next/server";

export async function GET(request: Request) {
  const url = new URL(request.url);

  // Access query parameters
  const search = url.searchParams.get("search") || "";
  const page = parseInt(url.searchParams.get("page") || "1");
  const limit = parseInt(url.searchParams.get("limit") || "10");

  const books = await prisma.book.findMany({
    where: {
      OR: [
        {
          title: {
            contains: search,
          },
        },
      ],
    },
    skip: (page - 1) * limit,
    take: limit,
  });

  return NextResponse.json({
    search,
    page,
    limit,
    books,
  });
}

export async function POST(request: Request) {
  const data = await request.json();

  const book = await prisma.book.create({
    data,
  });

  return NextResponse.json(book);
}

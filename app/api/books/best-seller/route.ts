// api route get popular books

import prisma from "@/lib/prisma";
import { NextResponse } from "next/server";

export async function GET(request: Request) {
  const url = new URL(request.url);

  // Access query parameters
  const page = parseInt(url.searchParams.get("page") || "1");
  const limit = parseInt(url.searchParams.get("limit") || "10");
  const books = await prisma.book.findMany({
    orderBy: {
      ratings_count: "desc",
    },
    skip: (page - 1) * limit,
    take: limit,
  });

  return NextResponse.json({
    page,
    limit,
    books,
  });
}

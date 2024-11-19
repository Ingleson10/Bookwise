import { NextResponse } from "next/server";
import { PrismaClient } from "@prisma/client";
import { empresaSchema } from "@/components/utils/types/schemas"

const prisma = new PrismaClient();
export async function POST(request: Request) {
  try {
    const json = await request.json();
    const data = empresaSchema.parse(json);
    const empresa = await prisma.empresa.create({ data });
    return NextResponse.json(empresa, { status: 201 });
  } catch (error) {
    if (error instanceof Error) {
      return NextResponse.json({ error: error.message }, { status: 400 });
    }
    return NextResponse.json({ error: "Unknown error" }, { status: 500 });
  }
}

import { NextRequest, NextResponse } from "next/server";


export function middleware(request: NextRequest): NextResponse {

        const user = 'asd';

        if (!user){
            return NextResponse.redirect(new URL("/", request.url));
        }

    return NextResponse.next();
}

export const config = {
    matcher: ["/admin"],
}
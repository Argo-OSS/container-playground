import { NextResponse } from "next/server";

export const GET = () => {
  return NextResponse.json({ status: 'Hello World healtCheck' });
};

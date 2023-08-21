import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get('/healthcheck')
  getHealthCheck(): string {
    return "OK";
  }

  @Get('/api/v1/siontama')
  siontama(): string {
    return "siontama";
  }
}

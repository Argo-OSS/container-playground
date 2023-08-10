import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller('/')
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get('/api/v1/yunwoo-yu')
  getYunwoo() {
    return this.appService.getYunwoo();
  }

  @Get('/healthcheck')
  getHealthCheck() {
    return this.appService.getHealthCheck();
  }
}

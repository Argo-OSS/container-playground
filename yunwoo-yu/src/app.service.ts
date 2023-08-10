import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getYunwoo(): string {
    return 'api yunwoo-yu github data';
  }

  getHealthCheck(): string {
    return '백엔드를 해보니 건강이 나빠지는거 같은 기분이 듭니다,,';
  }
}

import { FirebaseAuthenticationService } from '@aginix/nestjs-firebase-admin';
import { Args, Mutation, Query, Resolver } from '@nestjs/graphql';
import { JwtService } from '@nestjs/jwt';
import { SharedRiderService } from '@ridy/order/shared-rider.service';
import { RiderDTO } from '../rider/dto/rider.dto';
import { LoginDTO } from './dto/login.dto';
import { LoginInput } from './dto/login.input';
import { AuthenticatedUser } from './jwt.strategy';

@Resolver()
export class AuthResolver {
  constructor(
    private firebaseAuth: FirebaseAuthenticationService,
    private riderService: SharedRiderService,
    private jwtService: JwtService
  ) {}

  @Mutation(() => LoginDTO)
  async login(
    @Args('input', { type: () => LoginInput }) input: LoginInput
  ): Promise<LoginDTO> {
    const decodedToken = await this.firebaseAuth.app
      .auth()
      .verifyIdToken(input.firebaseToken);
    const number = (decodedToken.firebase.identities.phone[0] as string).substring(1);
    const user = await this.riderService.findOrCreateUserWithMobileNumber(
      number
    );
    const payload = { id: user.id };
    return {
      jwtToken: this.jwtService.sign(payload),
    };
  }

  @Query(() => RiderDTO)
  async me(@Args('token', {type: () => String}) token: string): Promise<RiderDTO> {
    const decoded = this.jwtService.decode(token) as AuthenticatedUser;
    return this.riderService.findById(decoded.id);
  }
}

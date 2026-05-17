import random
import pygame
import time

SHOT_DELAY = 500  # 射击延迟500ms
ENEMY_SHOT_DELAY = 2000  # 敌机射击频率
FREQUENCY = 20  # 刷怪频率
ENEMYSPEED = 4#敌人速度
PLAYERSPEED = 20#玩家速度
HP_MAX = 5#最大血量
HP = 3


class Enemyplane(pygame.sprite.Sprite):  # 里面写的是精灵类
    enemy_bullets = pygame.sprite.Group()
    def __init__(self, screen):
        # 精灵初始化：
        pygame.sprite.Sprite.__init__(self)
        self.player = pygame.image.load("./images/images/enemy0.png")  # 51*39
        # 获取矩阵图像
        self.rect = self.player.get_rect()
        self.rect.topleft = [random.randint(0, 380), 0]#初始位置
        self.speed = ENEMYSPEED
        self.screen = screen  # 将窗口变成飞机类的属性
        self.bullets = pygame.sprite.Group()  # 子弹列表存所有子弹
        if random.randint(0, 1) == 1:
            self.direction = 'right'
        else:
            self.direction = 'left'#随机数方法判断方向
        self.lastshot = 0#控制设计频率

    def display(self):
        self.screen.blit(self.player, self.rect)
        self.bullets.update()
        self.bullets.draw(self.screen)

    def update(self):
        self.automove()
        self.autofire()
        self.display()

    def automove(self):
        self.rect.bottom += self.speed
        if self.direction == 'right':
            self.rect.right += self.speed + random.randint(1, 3)#存在一定随机性，可能速度稍快或者稍慢
            if self.rect.right > 480 - 51:#到边界以后转向
                self.direction = 'left'
        elif self.direction == 'left':
            self.rect.left -= self.speed + random.randint(1, 3)
            if self.rect.left < 51:
                self.direction = 'right'

    def autofire(self):

        # random_time=random.randint(1,10)
        # if random_time==2:
        #     bullet = EnemyBullet(self.screen, self.rect.left, self.rect.bottom)
        #     self.bullets.add(bullet)  # 子弹显示在列表
        #     Enemyplane.enemy_bullets.add(bullet)

        # 上面的是随机射击，射击速率不定

        current_time = pygame.time.get_ticks()
        if current_time - self.lastshot > ENEMY_SHOT_DELAY:
            bullet = EnemyBullet(self.screen, self.rect.left, self.rect.bottom)
            self.bullets.add(bullet)  # 子弹显示在列表
            Enemyplane.enemy_bullets.add(bullet)
            self.lastshot = current_time

    def claer(self):
        self.bullets.empty()#出界或被打死则清除


class EnemyBullet(pygame.sprite.Sprite):
    def __init__(self, screen, x, y):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.image.load("./images/images/bullet1.png")
        self.rect = self.image.get_rect()
        self.rect.topleft = [x + 25 / 2, y - 35]
        self.screen = screen# 将窗口变成子弹类的属性
        self.speed = 20

    def update(self):
        self.rect.top += self.speed#子弹移动
        if self.rect.top > 852:
            self.kill()
class playerplane(pygame.sprite.Sprite):  # 创建飞机类
    bullets = pygame.sprite.Group()
    def __init__(self, screen):
        pygame.sprite.Sprite.__init__(self)
        self.player = pygame.image.load("./images/images/hero1.png")
        self.rect = self.player.get_rect()
        self.rect.topleft = [480 / 2 - 100.2, 700]
        self.speed = PLAYERSPEED
        self.screen = screen  # 将窗口变成飞机类的属性
        self.bullets = pygame.sprite.Group()  # 子弹列表存所有子弹
        self.last_shot = 0

    def key_control(self):
        key_pressed = pygame.key.get_pressed()
        current_time = pygame.time.get_ticks()
        if key_pressed[pygame.K_UP]:
            if self.rect.top > 0:#不能出边界，所以进行判断
                print("上移")
                self.rect.top -= self.speed
        if key_pressed[pygame.K_DOWN]:
            if self.rect.bottom < 852:
                print("下移")
                self.rect.bottom += self.speed
        if key_pressed[pygame.K_LEFT]:
            if self.rect.left > 0:
                print("左移")
                self.rect.left -= self.speed
        if key_pressed[pygame.K_RIGHT]:
            if self.rect.right < 480:
                print("右移")
                self.rect.right += self.speed
        if key_pressed[pygame.K_SPACE] and current_time - self.last_shot > SHOT_DELAY:#按住射击键并且时间差大于上次射击间隔
            bullet = Bullet(self.screen, self.rect.left, self.rect.top)#新建己方子弹类
            self.bullets.add(bullet)  # 子弹显示在列表
            playerplane.bullets.add(bullet)
            print("射击")
            self.last_shot = current_time#更新上次射击时间
        elif key_pressed[pygame.K_ESCAPE]:#随时退出
            pygame.quit()
            exit()

    def display(self):
        self.screen.blit(self.player, self.rect)
        self.bullets.update()
        self.bullets.draw(self.screen)#展示子弹位置

    def update(self):
        self.key_control()
        self.display()

    def claer(self):
        self.bullets.empty()


class Bullet(pygame.sprite.Sprite):#子弹类
    def __init__(self, screen, x, y):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.image.load("./images/images/bullet.png")
        self.rect = self.image.get_rect()
        self.rect.topleft = [x + 100 / 2 - 22 / 2, y - 22]
        self.screen = screen
        self.speed = 20

    def update(self):
        self.rect.top -= self.speed
        if self.rect.top < 22:
            self.kill()


class Bomb(object):
    def __init__(self, screen, type):
        self.screen = screen
        if type == "enemy":#判断爆炸类型，因为只可能是己方飞机或对方飞机爆炸
            self.mImages = [pygame.image.load("./images/images/enemy0_down" + str(v) + ".png") for v in range(1, 5)]
            # 列表推导式判断
        else:
            self.mImages = [pygame.image.load("./images/images/me_destroy_n" + str(v) + ".png") for v in range(1, 5)]
        self.mIndex = 0  # 设置爆炸播放索引，当索引大于播放图片总数时证明播放完成
        self.mPos = [0, 0]#爆炸坐标存储位置
        self.mVisible = False#暂时不可见，保证持续循环时看到这里不爆炸

    def action(self, rect):  # 设置爆炸坐标
        self.mPos[0] = rect.left
        self.mPos[1] = rect.top
        self.mVisible = True 

    def draw(self):
        if not self.mVisible:
            return
        self.screen.blit(self.mImages[self.mIndex], (self.mPos[0], self.mPos[1]))
        self.mIndex += 1
        if self.mIndex >= len(self.mImages):#爆炸动画播放完毕，改变状态
            self.mIndex = 0
            self.mVisible = False


class GameSound(object):
    def __init__(self):
        pygame.mixer.init()#初始化音频模块
        pygame.mixer.music.load("./musics/backgroundmusic.mp3")
        pygame.mixer.music.set_volume(0.03)  # 调声音
        self._bombplayer = pygame.mixer.Sound("./musics/me_down.wav")
        self._bombenemy = pygame.mixer.Sound("./musics/enemy1_down.wav")
        self._hpplus=pygame.mixer.Sound("./musics/button.wav")
        self._gameover_=pygame.mixer.Sound("./musics/2643.wav")

    def playBombSound(self):
        pygame.mixer.Sound.play(self._bombplayer)

    def enemyBombSound(self):
        pygame.mixer.Sound.play(self._bombenemy)

    def BackgroundMusic(self):
        pygame.mixer.music.play(-1)  # 开始连续播放

    def hpupMusic(self):
        pygame.mixer.Sound.play(self._hpplus)

    def gameover(self):
        pygame.mixer.Sound.play(self._gameover_)


    def Endmusic(self):
        pygame.mixer.music.stop()


class Manager(object):  # 进行面向对象编程,管理类
    def __init__(self):
        pygame.init()
        self.screen = pygame.display.set_mode((480, 852))#窗口大小设置
        self.startbutton = pygame.image.load("./images/images/startn.png")
        self.background = pygame.image.load("./images/images/background.png")
        self.restartbutton = pygame.image.load("./images/images/again.png")
        self.exitbutton = pygame.image.load("./images/images/gameover.png")
        self.pausebutton = pygame.image.load("./images/images/pause_nor.png")
        self.players = pygame.sprite.Group()#保存和管理多个sprite的容器类
        self.enemys = pygame.sprite.Group()
        self.player_bomb = Bomb(self.screen, 'player')#输入类型
        self.enemy_bomb = Bomb(self.screen, 'enemy')
        self.sound = GameSound()
        self.restart = False#判断是从重新开始界面进入的还是点开运行进入的

    def exit(self):
        print("退出")
        pygame.quit()
        exit()

    def new_player(self):
        player = playerplane(self.screen)
        self.players.add(player)

    def new_enemy(self):
        enemy = Enemyplane(self.screen)
        self.enemys.add(enemy)

    def drawTest(self, test, x, y, testHeight=30, fontcolour=(0, 0, 0), backgroundcolor=None):
        '''test是文本文字，height是字体大小'''
        font_obj = pygame.font.Font('./images/images/Candara.ttf', testHeight)#加载字体文件
        text_obj = font_obj.render(test, True, fontcolour, backgroundcolor)
        #font_obj.render是创建一个surface对象，包括了渲染后的文本
        text_rect = text_obj.get_rect()#获取一个矩形大小
        text_rect.topleft = (x, y)#设置位置
        self.screen.blit(text_obj, text_rect)#展示到行上

    def drawGAMEOVER(self, test, x, y, testHeight=50, fontcolour=(0, 0, 0), backgroundcolor=None):
        font_obj = pygame.font.Font('./images/images/Candara.ttf', testHeight)
        text_obj = font_obj.render(test, True, fontcolour, backgroundcolor)
        text_rect = text_obj.get_rect()
        text_rect.topleft = (x, y)
        self.screen.blit(text_obj, text_rect)

    def drawStart(self, test, x, y, testHeight=40, fontcolour=(0, 0, 0), backgroundcolor=None):
        font_obj = pygame.font.Font('./images/images/Candarab.ttf', testHeight)
        text_obj = font_obj.render(test, True, fontcolour, backgroundcolor)
        text_rect = text_obj.get_rect()
        text_rect.topleft = (x, y)
        self.screen.blit(text_obj, text_rect)

    def drawTitle(self, test, x, y, testHeight=70, fontcolour=(127, 127, 127), backgroundcolor=None):
        font_obj = pygame.font.Font('./images/images/STHUPO.ttf', testHeight)
        text_obj = font_obj.render(test, True, fontcolour, backgroundcolor)
        text_rect = text_obj.get_rect()
        text_rect.topleft = (x, y)
        self.screen.blit(text_obj, text_rect)

    def main(self):  # 执行类函数
        self.sound.BackgroundMusic()
        time_enemy = 0  # 刷怪频率
        score = 0
        live_enemy = 1#存活敌人，如果场上没有敌人就马上刷一个
        hp = HP
        start = True
        gameover = False
        time_restart = 0
        pause=False
        while start and not self.restart:
            self.screen.blit(self.background, (0, 0))
            self.screen.blit(self.startbutton, (200, 550))
            self.drawStart("PRESS To START", 100, 450)
            self.drawTitle("飞 机 大 战", 80, 240)
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    print("exit")
                    exit()
                elif event.type == pygame.KEYDOWN:
                    # 检查是否为非ESC键
                    if event.key == pygame.K_ESCAPE:
                        print("exit")
                        exit()
                    else:
                        start = False
                elif event.type == pygame.MOUSEBUTTONDOWN:
                    #判断是否是鼠标点击按钮进入
                    mouse_x, mouse_y = event.pos#获取鼠标位置坐标
                    if 200 <= mouse_x <= 260 and 550 <= mouse_y <= 596:
                        start = False
            pygame.display.update()#更新界面
        if self.restart == True:
            self.restart = False#重设restart
        self.new_player()
        self.new_enemy()

        while not gameover:
            self.screen.blit(self.background, (0, 0))
            for event in pygame.event.get():  # 接受事件
                if event.type == pygame.QUIT:
                    self.exit()
                elif event.type == pygame.MOUSEBUTTONDOWN:
                    mouse_x, mouse_y = event.pos
                    if 0<= mouse_x <= 100 and 0 <= mouse_y <= 100:
                       pause=True#点击暂停键
            while pause:
                self.screen.blit(self.startbutton, (0, 0))
                self.drawGAMEOVER("PAUSE" , 100, 340)
                self.drawGAMEOVER("SCORE:" + str(score), 100, 440)
                self.drawGAMEOVER("HP:" + str(hp), 100, 540)
                for event in pygame.event.get():  # 接受事件
                    if event.type == pygame.QUIT:
                        self.exit()
                    elif event.type == pygame.MOUSEBUTTONDOWN:
                        mouse_x, mouse_y = event.pos
                        if 0 <= mouse_x <= 100 and 0 <= mouse_y <= 100:
                            pause = False
                pygame.display.update()
            self.screen.blit(self.pausebutton, (0, 0))
            self.drawTest("hp:" + str(hp), 0, 820)
            self.drawTest("score:" + str(score), 350, 820)
            self.player_bomb.draw()#开启爆炸特效，但是因为mVisiblew=False所以始终不运行
            self.enemy_bomb.draw()
            # 飞机相撞
            iscollide = pygame.sprite.groupcollide(self.players, self.enemys, False, True)  # 飞机相撞
            #False代表碰撞后不消失，True代表消失，这个函数通过判断矩形位置来确定是否发生碰撞
            if iscollide:
                if hp > 0:
                    # 减少生命值
                    hp -= 1
                    # 获取第一个碰撞的玩家和敌人，只取第一个
                    live_enemy -= 1#碰撞最后一个敌机以后立马出一个容易马上又碰上
                    items_list = list(iscollide.items())
                    first_item = items_list[0]
                    player, enemies = first_item
                    enemy = enemies[0]
                    # 只播放声音
                    self.enemy_bomb.action(enemy.rect)#敌人碰撞死亡
                    self.sound.playBombSound()
                if hp == 0:
                    # 播放碰撞动画
                    enemy = enemies[0]
                    self.players.remove(player)
                    self.player_bomb.action(player.rect)
                    self.enemy_bomb.action(enemy.rect)
                    self.sound.playBombSound()
                    self.enemys.empty()
                    self.players.empty()#清除敌我飞机
                    playerplane.bullets.empty()
                    Enemyplane.enemy_bullets.empty()#清除场上子弹

            # 敌机子弹打到自己
            is_player = pygame.sprite.groupcollide(Enemyplane.enemy_bullets, self.players, True, False)
            if is_player:
                if hp > 0:
                    # 获取第一个碰撞的玩家和敌人
                    for bullet, players in is_player.items():
                        for player in players:
                            self.sound.playBombSound()
                            hp -= 1
                            break
                        break
                if hp == 0:
                    # 播放碰撞动画
                    self.player_bomb.action(player.rect)
                    self.sound.playBombSound()
                    self.enemys.empty()
                    self.players.empty()
                    playerplane.bullets.empty()
                    Enemyplane.enemy_bullets.empty()

            # 自己打到敌机
            is_enemy1 = pygame.sprite.groupcollide(playerplane.bullets, self.enemys, True, True)
            if is_enemy1:
                for bullet, enemies in is_enemy1.items():
                    for enemy in enemies:
                        # 对敌人和子弹做出相应的处理
                        self.enemy_bomb.action(enemy.rect)
                        Enemyplane.enemy_bullets.empty()
                        score += 1
                        live_enemy-=1
                        if score % 10 == 0 and hp < HP_MAX:
                            self.sound.hpupMusic()
                            hp += 1
                        else:
                            self.sound.enemyBombSound()
                        #只处理第一个碰撞的敌人和子弹
                        break
                    break  # 只处理第一个碰撞

            self.players.update()  # 包含players的类，所以可以调用
            self.enemys.update()
            if len(self.players)==0 and len(self.enemys)==0:
                #两个精灵组都空了
                if time_restart==4:
                    gameover=True
                else:
                    time_restart+=1
            if (time_enemy == FREQUENCY and hp>0) or live_enemy==0:  # 刷怪频率
                time_enemy = 0
                live_enemy+=1
                self.new_enemy()
            else:
                time_enemy += 1
            pygame.display.update()
            time.sleep(0.1)#帧率（更新时间）

        self.sound.Endmusic()#结束背景音乐
        self.sound.gameover()
        while True:
            self.screen.blit(self.background, (0, 0))
            self.drawGAMEOVER("GAMEOVER", 100, 340)
            self.drawGAMEOVER("SCORE:" + str(score), 100, 440)
            self.screen.blit(self.restartbutton, (100, 540))  # 300,40
            self.screen.blit(self.exitbutton, (100, 600))
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    print("exit")
                    exit()
                elif event.type == pygame.KEYDOWN:
                    # 检查是否为非ESC键
                    if event.key != pygame.K_ESCAPE:
                        self.players.empty()
                        self.enemys.empty()
                        self.restart = True
                        manager.main()
                    else:
                        print("exit")
                        exit()
                elif event.type == pygame.MOUSEBUTTONDOWN:
                    mouse_x, mouse_y = event.pos
                    if 100 <= mouse_x <= 400 and 510 <= mouse_y <= 570:
                        self.restart = True
                        manager.main()
                    elif 100 <= mouse_x <= 400 and 590 <= mouse_y <= 650:
                        print("exit")
                        exit()
            pygame.display.update()


if __name__ == '__main__':
    manager = Manager()
    manager.main()



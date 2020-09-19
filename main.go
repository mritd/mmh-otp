package main

import (
	"fmt"
	"log"
	"os"
	"time"

	"github.com/pquerna/otp/totp"

	"github.com/urfave/cli/v2"
)

func main() {
	app := &cli.App{
		Name:      "motp",
		Usage:     "simple otp tool",
		Version:   "0.0.1",
		UsageText: "motp SECRET",
		Action: func(c *cli.Context) error {
			secret := c.Args().First()
			if secret == "" {
				cli.ShowAppHelpAndExit(c, 1)
			}

			code, err := totp.GenerateCode(secret, time.Now())
			if err != nil {
				return err
			}

			fmt.Println(code)
			return nil
		},
	}

	if err := app.Run(os.Args); err != nil {
		log.Fatal(err)
	}
}

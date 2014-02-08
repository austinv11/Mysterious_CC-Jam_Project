function gitGet(user, repo, branch, path, toPath)
        local dl = http.get("https://raw.github.com/"..user.."/"..repo.."/"..branch.."/"..path)
        term.write("Connecting to GitHub.......")
        sleep(.125)
        if dl then
                print("Connected!")
                local file = dl.readAll()
                term.write("Downloading File.......")
                dl.close()
                sleep(.125)
                local check = fs.exists(toPath)
                if check == true then
                        term.setTextColor(colors.red)
                        print("Error: File Already Exists!")
                        term.setTextColor(colors.white)
                else
                        local w = fs.open(toPath,"w")
                        if w then
                                w.write(file)
                                w.close()
                                print("Downloaded as "..toPath.."!")
                                return true
                        else
                                w.close()
                                term.write("Download Failed!")
                                end
                        end
        else
                term.setTextColor(colors.red)
                print("Connection Failed!")
                term.setTextColor(colors.white)
                end
        end

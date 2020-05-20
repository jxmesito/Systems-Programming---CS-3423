# if the first char in $1 is a " d "  it is a directory
# if the first char in $1 is a " - "  it is a file
# if the first char in $1 is a " s "  it is "others"


# $1 first element is permissions
# $2 second element is number of hard links
# $3 third element is userName
# $4 fourth element is group
# $5 fifth element is fileSize
# $6 sixth element is date
# $7 seventh element is time
# $8 eighth element is fileName/fileType

BEGIN {
    totalUsers=0;
    totalFiles=0;
    totalHid=0;
    totalDirs=0;
    totalOthers=0;
    totalSize=0;
    oldDate=newDate=$6
    oldTime=newTime=$7
}
NR == 1 { next }

{
    # storing information into users
    if ($3 in users || $3 != NULL) {
        users[$3]++
    }
    if ($1 ~ /^-/) {
        files[$3]++
        totalFiles++
        if ($8 ~ /^[.]/) {
            hidFile[$3]++
            totalHid++
        }

        fileSize[$3] += $5
        totalSize += $5
    }
    else if ($1 ~ /^d/) {
        dirs[$3]++
        totalDirs++
    }
    else if($1 ~ /^s/) {
        others[$3]++
        totalOthers++
    }
    
    # sorting times
    date=$6
    if (date > newDate) { 
        newFile = $0;
    }
    if (date  < oldDate) {
        oldFile = $0;
    }
    

}

END { 
    for(user in users) {
        print "\nuser: " user;
        if (files[user] != NULL) {
            if (hidFile[user] == NULL)
                hidFile[user] = 0;
            print "   files: \n     all/hidden: (",files[user]," / ",hidFile[user],")";
        }
        if (dirs[user] != NULL) {
        print "   dirs: " dirs[user];
        }
        if (others[user] != NULL) {
            print "   others: " others[user];
        }
        if (fileSize[user] != NULL) {
            print "   file storage: ", fileSize[user]" B";
        }
    }

    printf ("\noldest file: %s"), oldFile;
    printf ("\nnewest file:  %s"), newFile;

    for (user in users)
        totalUsers++
        print "\ntotal users:", totalUsers;
        print "total files\n      all/hidden:","(", totalFiles, " / ", totalHid," )";
        print "total dirs:      ", totalDirs;
        print "total others:    ", totalOthers;
        print "file storage:    ", totalSize , "B"; 
}
